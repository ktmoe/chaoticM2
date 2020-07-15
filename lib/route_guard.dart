import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/authenticate/authenticate_widget.dart';
import 'package:m2mobile/pages/splash/splash_widget.dart';
import 'package:m2mobile/pages/login/login_widget.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
class M2Guard implements RouteGuard {
  // final StoreApp _appStore = StoreApp();

  @override
  //if returned true allowed to go
  bool canActivate(String url) {
    print(url);
    if (url == SplashWidget.route ||
        url == LoginWidget.route ||
        url == AuthenticateWidget.route) {
      return true;
    } else {
      return true;
    }
  }

  @override
  List<GuardExecutor> get executors => [M2GuardExecutor()];
}

class M2GuardExecutor implements GuardExecutor {
  @override
  void onGuarded(String path, {bool isActive}) {
    print("Path $path");
    if (!isActive) {
      print('language ko twar');

      Modular.to.pushNamed(LanguageWidget.route);
    }
    // } else {
    //   Modular.to.pushReplacementNamed(LoginWidget.route);
    // }
  }
}
