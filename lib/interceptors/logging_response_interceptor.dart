import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';

class LoggingResponseInterceptor extends ResponseInterceptor {
  final Logger logger;

  LoggingResponseInterceptor(this.logger);
  @override
  FutureOr<Response> onResponse(Response response) {
    logger.i(response.body);
    return response;
  }
}
