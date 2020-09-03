import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/main/more/settings/change_password/change_password_widget.dart';
import 'package:m2mobile/pages/main/more/settings/settings_widget.dart';
import 'package:m2mobile/stores/store_change_password.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => StoreChangePassword())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SettingsWidget()),
        Router('/change_password', child: (_, args) => ChangePasswordWidget())
      ];
}
