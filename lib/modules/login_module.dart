import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/modules/authenticate_module.dart';
import 'package:m2mobile/pages/login/login_widget.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginWidget()),
        Router("/authenticate", module: AuthenticateModule())
      ];
}
