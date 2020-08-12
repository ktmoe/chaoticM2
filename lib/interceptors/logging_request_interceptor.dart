import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'package:m2mobile/interceptors/curl_generator.dart';

class LoggingRequestInterceptor extends RequestInterceptor {
  final Logger logger;

  LoggingRequestInterceptor(this.logger);
  @override
  FutureOr<Request> onRequest(Request request) async {
    logger.i(await CURLGenerator.getCURLFromRequest(request));
    // logger.i(
    //     "${request.baseUrl}, ${request.url}\n parameters: ${request.parameters}\n parts: ${request.parts}\n body: ${request.body}");
    return request;
  }
}
