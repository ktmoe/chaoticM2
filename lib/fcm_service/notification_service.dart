import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  static NotificationService instance;

  // NotificationService get instance => _instance;

  bool isInit = false;

  NotificationService._()
      : _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return instance ??= NotificationService._();
  }

  Future init() async {
    if (isInit) {
      throw Exception("notification already initialized");
    } else {
      isInit = true;
    }
    print("Initializing local notifications...");

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initializationSettingsIOS = IOSInitializationSettings();

    const initializationSettings = InitializationSettings(
      initializationSettingsAndroid,
      initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      final message = json.decode(payload);
      print("message when onTapped => $message");
      if (message['type'] == "other") {
        print("noti others tapped");
        //  Modular.to.pushNamed(AppRoutes.notiOthers);
      } else {
        //  Modular.to.pushNamed(NotiOrderDetailWidget.route,arguments: message['orderid'] as String);
      }
    });
  }

  Future show(dynamic message) async {
    if (!isInit) throw "Noti not initialized";

    print("init status when showing noti => $isInit");

    print("inside noti show => $message");

    final data = message['data'];

    print("inside noti show data only => $data");

    final androidNotificationDetails = AndroidNotificationDetails(
        'com.gnwt.m2mobile',
        'M2 Notification Channel',
        'This is channel description',
        priority: Priority.Max,
        importance: Importance.Max,
        playSound: true,
        largeIcon: const DrawableResourceAndroidBitmap("app_icon"),
        icon: 'app_icon');

    const iosNotificationDetails = IOSNotificationDetails();

    final platformChannelSpecifics =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);

    print("message inside notification service => $data");

    await _flutterLocalNotificationsPlugin.show(0, data['title'] as String,
        data['message'] as String, platformChannelSpecifics,
        payload: json.encode(data));
  }
}
