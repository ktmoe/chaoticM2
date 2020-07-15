import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:m2mobile/utils/constants.dart';

part 'jwt_service.chopper.dart';

@ChopperApi(baseUrl: '/jwt')
abstract class JwtService extends ChopperService {
  static JwtService instance;

  static JwtService create() {
    final client = ChopperClient(
        baseUrl: baseUrl,
        services: [_$JwtService()],
        converter: JsonConverter());

    instance ??= _$JwtService(client);

    return instance;
  }

  @Get(path: '/token', headers: {HttpHeaders.authorizationHeader: basicAuth})
  Future<Response> getToken();
}
