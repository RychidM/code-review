import 'package:dio/dio.dart';

import '../utils/logger.dart';

class NetworkLogging extends Interceptor {
  var log = getLogger('NetworkLogging');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.d(
        'REQUEST[${options.method}] => PATH: ${options.path} => URL: ${options.uri} '
        'HEADER: ${options.headers} '
        '=> BODY: ${options.data} => QUERY: ${options.queryParameters}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.d(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} => ERROR: ${err.message.toString()}'
      '=> ERROR: ${err.error.toString()}}',
    );
    return super.onError(err, handler);
  }
}
