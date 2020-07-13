import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/notification/notification_widget.dart';
import 'package:m2mobile/pages/main/notification/notification_detail/notification_detail_widget.dart';

class NotificationModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NotificationWidget()),
        Router('/notification_detail',
            child: (_, args) => NotificationDetailWidget())
      ];
}
