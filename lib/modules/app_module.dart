import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/app_widget.dart';
import 'package:m2mobile/modules/login_module.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
import 'package:m2mobile/pages/splash/splash_widget.dart';
import 'package:m2mobile/stores/splash_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => SplashStore())];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (context, args) => SplashWidget()),
        Router("/language", child: (context, args) => LanguageWidget()),
        Router("/login", module: LoginModule())
      ];
}
