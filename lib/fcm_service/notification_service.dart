import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:m2mobile/models/noti.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/notification/notification_detail/notification_detail_widget.dart';

class NotificationService {
  bool isInit = false;

  Future init() async {
    if (!isInit) {
      isInit = true;
    }

    const initializationSettingsAndroid =
        AndroidInitializationSettings('m2_noti_icon');

    const initializationSettingsIOS = IOSInitializationSettings();

    const initializationSettings = InitializationSettings(
      initializationSettingsAndroid,
      initializationSettingsIOS,
    );

    await Modular.get<FlutterLocalNotificationsPlugin>().initialize(
        initializationSettings, onSelectNotification: (payload) async {
      final message = json.decode(payload);

      final desc = message["description"];
      final title = message["title"];
      final image = message["imageurl"];
      Noti notification = Noti((b) {
        b.id = "";
        b.description = desc;
        b.title = title;
        b.imageurl = image;
      });
      Modular.to
          .pushNamed(NotificationDetailWidget.route, arguments: notification);
    });
  }
}
