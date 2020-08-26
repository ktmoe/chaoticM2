import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/models/noti.dart';
import 'package:m2mobile/pages/main/notification/notification_detail/notification_detail_widget.dart';

class FirebaseMessagingService implements Disposable {
  FirebaseMessaging _fcm;
  StreamSubscription _iosSubscription;

  FirebaseMessagingService() {
    _fcm = FirebaseMessaging();
    if (Platform.isIOS) {
      _iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _firebaseSetUp();
  }

  void _firebaseSetUp() {
    _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          _showNotification(message["data"]);
        },
        onLaunch: (Map<String, dynamic> message) async {
          _navigateToNotiDetail(message);
        },
        onResume: (Map<String, dynamic> message) async {
          _navigateToNotiDetail(message);
        },
        onBackgroundMessage: backgroundMessageHandler);
    _fcm.subscribeToTopic("M2");
  }

  void _navigateToNotiDetail(Map<String, dynamic> message) {
    final desc = message["data"]["description"];
    final title = message["data"]["title"];
    final image = message["data"]["imageurl"];
    Noti notification = Noti((b) {
      b.id = "";
      b.description = desc;
      b.title = title;
      b.imageurl = image;
    });
    Modular.to
        .pushNamed(NotificationDetailWidget.route, arguments: notification);
  }

  static Future<dynamic> backgroundMessageHandler(
      Map<String, dynamic> message) async {
    try {
      final SendPort sp =
          IsolateNameServer.lookupPortByName("notification-isolate");
      sp.send(message);
    } catch (e) {
      print("error in background message handler => $e");
    } finally {
      _showNotification(message["notification"]);
    }
  }

  static Future _showNotification(dynamic data) async {
    final androidNotificationDetails = AndroidNotificationDetails(
        'com.gnwt.m2mobile',
        'M2 Notification Channel',
        'This is channel description',
        priority: Priority.Max,
        icon: "m2_noti_icon",
        largeIcon: const DrawableResourceAndroidBitmap("m2_noti_icon"),
        importance: Importance.Max,
        playSound: true,
        enableVibration: true,
        enableLights: true);

    const iosNotificationDetails = IOSNotificationDetails();

    final platformChannelSpecifics =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);

    await Modular.get<FlutterLocalNotificationsPlugin>().show(
        0,
        data['title'] as String,
        data['description'] as String,
        platformChannelSpecifics,
        payload: json.encode(data));
  }

  @override
  void dispose() {
    _iosSubscription?.cancel();
  }
}
