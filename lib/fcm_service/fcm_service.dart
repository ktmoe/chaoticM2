import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/fcm_service/notification_service.dart';

class FirebaseMessagingService implements Disposable {
  FirebaseMessaging _fcm;
  StreamSubscription _iosSubscription;
  NotificationService _notificationService = Modular.get<NotificationService>();

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
        debugPrint(json.encode(message));
        // var title = message['notification']['title'] ?? "PTBGo";
        // var body = message['notification']['body'] ?? "No Message";
        _notificationService.show(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  void dispose() {
    _iosSubscription?.cancel();
  }
}
