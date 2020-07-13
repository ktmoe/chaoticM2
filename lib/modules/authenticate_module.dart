import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/modules/main_module.dart';
import 'package:m2mobile/pages/login/authenticate/authenticate_widget.dart';
import 'package:m2mobile/stores/authenticate_store.dart';

class AuthenticateModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => AuthenticateStore())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (context, args) => AuthenticateWidget()),
        Router("/main", module: MainScreenModule())
      ];
}
