import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/app_widget.dart';
import 'package:m2mobile/data/api/api_service.dart';
import 'package:m2mobile/data/api/jwt_service.dart';
import 'package:m2mobile/interceptors/jwt_interceptor.dart';
import 'package:m2mobile/modules/authenticate_module.dart';
import 'package:m2mobile/modules/login_module.dart';
import 'package:m2mobile/modules/main_module.dart';
import 'package:m2mobile/pages/language/language_widget.dart';
import 'package:m2mobile/pages/splash/splash_widget.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/stores/store_app.dart';
import 'package:m2mobile/route_guard.dart';

import 'package:m2mobile/utils/custom_json_converter.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StoreApp()),
        Bind((i) => ChopperClient(
              interceptors: [
                JWTInterceptor(),
                HttpLoggingInterceptor(),
                CurlInterceptor(),
                // HeadersInterceptor({HttpHeaders.authorizationHeader: bearerToken})
              ],
              baseUrl: baseUrl,
              converter: const CustomJsonConverter(),
              errorConverter: const CustomJsonConverter(),
              services: [ApiService.create()],
            )),
        Bind((i) => JwtService.create()),
        Bind((i) => ApiService.create(i.get<ChopperClient>()))
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => Router.group(routes: [
        Router("/", child: (context, args) => SplashWidget()),
        Router("/language", child: (context, args) => LanguageWidget()),
        Router("/login", module: LoginModule()),
        Router("/authenticate", module: AuthenticateModule()),
        Router("/main", module: MainScreenModule())
      ], guards: [
        M2Guard()
      ]);
}
