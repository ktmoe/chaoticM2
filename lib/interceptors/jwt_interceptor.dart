import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/jwt_service.dart';

class JWTInterceptor implements RequestInterceptor {
  final service = Modular.get<JwtService>();

  @override
  FutureOr<Request> onRequest(Request request) async {
    // Future<Response> getToken;
    try {
      final getToken = await service.getToken();
    } catch (e) {
      debugPrint(e.toString());
    }

    // final response = getToken.body;

    // final requestHeaders = {
    //   HttpHeaders.authorizationHeader: "Bearer ${response['accessToken']}"
    // };

    // requestHeaders.addAll(request.headers);

    // final requestWithHeaders = request.copyWith(headers: requestHeaders);

    // debugPrint("jwt header => $requestWithHeaders");

    return request.copyWith(
        headers: {HttpHeaders.authorizationHeader: "Bearer afdsfasfsdaf"});
  }
}
