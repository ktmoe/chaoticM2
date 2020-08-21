import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/boxes/app_box.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:logger/logger.dart';

class FcmService {
  final FirebaseMessaging firebaseMessaging;

  FcmService._() : firebaseMessaging = Modular.get<FirebaseMessaging>();

  static FcmService instance;

  static String isolateChannelName = "isolate_for_firebase";

  final StreamController _streamController = StreamController();

  bool get hasListener => _streamController.hasListener;

  AppBox appBox;

  Stream<dynamic> get onMessageReceived => _streamController.stream;

  Future init() async {
    appBox = await AppBox.create();
    _setupIsolate();
    await _registerFirebaseNotification();
  }

  // ignore: sort_unnamed_constructors_first
  factory FcmService() {
    if (instance == null){
      instance = FcmService._();
      instance.init();
    }
    return instance;
  }

  void _setupIsolate() {
    print("isolate setup get called");
    final ReceivePort receivePort = ReceivePort();
    final SendPort sendPort = receivePort.sendPort;
    IsolateNameServer.registerPortWithName(sendPort, isolateChannelName);
    receivePort.listen((data) {
      print("data after listen => $data");
      _streamController.add(data);
    }, onError:(e){
      print("error at listen => $e");
    });
  }

  Future _registerFirebaseNotification() async {
    await firebaseMessaging.autoInitEnabled();
    await firebaseMessaging.requestNotificationPermissions();

    firebaseMessaging.onTokenRefresh.listen((token) async {
      final userId = Modular.get<StoreApp>().userProfile.id;
      if (userId != null) {
        var refreshResponse =
            await Modular.get<ApiService>().refreshToken(userId, token);
        Modular.get<Logger>()
            .i('FCM Token Refreshed and ${refreshResponse.body.data}');
      }
    });

    firebaseMessaging.configure(
        onResume: (Map<String, dynamic> message) async {
            print("onResume: $message");
        },
        onMessage: (Map<String, dynamic> message) async {
            print("onMessage: $message");
          _streamController.add(message);
        },
        onBackgroundMessage: backgroundMessageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
        });

    // firebaseMessaging.subscribeToTopic('jmahar');
  }

  static Future<dynamic> backgroundMessageHandler(
      Map<String, dynamic> message) async {
    try {
      final SendPort sp =
          IsolateNameServer.lookupPortByName(isolateChannelName);
      sp.send(message);
    } catch (e) {
      print("error in background message handler => $e");
    } finally {
      final data = message["data"];
      final title = data["title"] as String;
      final content = data["message"] as String;

      final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.gnwt.m2mobile',
        'M2 Notification Channel',
        'This is channel description',
        playSound: true,
        icon: "m2_noti_icon",
        enableVibration: true,
        importance: Importance.Max,
        largeIcon: const DrawableResourceAndroidBitmap("m2_noti_icon"),
        priority: Priority.High,
      );

      const iOSPlatformSpecifics = IOSNotificationDetails();

      final platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics,
        iOSPlatformSpecifics,
      );

      await FlutterLocalNotificationsPlugin().show(
          0, title, content, platformChannelSpecifics,
          payload: json.encode(data));
    }
  }
}
