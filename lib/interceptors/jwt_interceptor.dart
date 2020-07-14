import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/jwt_service.dart';


class JWTInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final service = JwtService.create();

    final getToken = await service.getToken();

    final response = getToken.body;

    final requestHeaders = {
      HttpHeaders.authorizationHeader: "Bearer ${response['accessToken']}"
    };

    requestHeaders.addAll(request.headers);

    final requestWithHeaders = request.copyWith(headers: requestHeaders);

    print("jwt header => $requestWithHeaders");

    return requestWithHeaders;
  }
}