import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/jwt_service.dart';

class JWTInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final service = Modular.get<JwtService>();
    final getToken = await service.getToken();
    final response = getToken.body;

    final requestHeaders = {
      HttpHeaders.authorizationHeader: "Bearer ${response['accessToken']}"
    };

    requestHeaders.addAll(request.headers);

    return request.copyWith(headers: requestHeaders);
  }
}
