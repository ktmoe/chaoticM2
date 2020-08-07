import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';

class LoggingRequestInterceptor extends RequestInterceptor {
  final Logger logger;

  LoggingRequestInterceptor(this.logger);
  @override
  FutureOr<Request> onRequest(Request request) {
    logger.i(
        "${request.baseUrl}, ${request.url}\n parameters: ${request.parameters}\n parts: ${request.parts}");
    return request;
  }
}
