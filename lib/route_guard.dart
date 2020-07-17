import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/pages/splash/splash_widget.dart';
import 'package:m2mobile/pages/login/login_widget.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
import 'package:m2mobile/pages/authenticate/authenticate_widget.dart';
import 'package:m2mobile/stores/store_app.dart';

class M2Guard implements RouteGuard {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  @override
  //if returned true allowed to go
  bool canActivate(String url) {
    print(url);
    if (url == SplashWidget.route ||
        url == LanguageWidget.route ||
        url == AuthenticateWidget.route ||
        url == LoginWidget.route) {
      return true;
    } else if (_storeApp.isFirstTime) {
      return (!_storeApp.isFirstTime);
    } else {
      return (_storeApp.isLoggedIn);
    }
  }

  @override
  List<GuardExecutor> get executors => [M2GuardExecutor()];
}

class M2GuardExecutor implements GuardExecutor {
  final StoreApp _storeApp = Modular.get<StoreApp>();
  @override
  void onGuarded(String path, {bool isActive}) {
    if (!isActive) {
      if (_storeApp.isFirstTime) {
        Modular.to.pushReplacementNamed(LanguageWidget.route);
      } else if (!_storeApp.isLoggedIn) {
        Modular.to.pushReplacementNamed(LoginWidget.route);
      }
    }
  }
}
