import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/data/api/jwt_service.dart';
import 'package:m2mobile/exceptions/app_exception.dart';

class JWTInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectionCheck = await _connectionAvailable();
    if (!connectionCheck) {
      throw AppException(message: "You are Offline.");
    }
    final jwtService = Modular.get<JwtService>();
    final getToken = await jwtService.getToken();
    final response = getToken.body;

    final requestHeaders = {
      if (true) HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.authorizationHeader: "Bearer ${response['accessToken']}"
    };

    requestHeaders.addAll(request.headers);

    return request.copyWith(headers: requestHeaders);
  }

  Future<bool> _connectionAvailable() async {
    try {
      final lookup = await InternetAddress.lookup("google.com");
      return lookup.isNotEmpty && lookup[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
