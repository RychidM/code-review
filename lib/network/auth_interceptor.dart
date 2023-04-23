import 'package:dio/dio.dart';

import '../../utils/logger.dart';


class AuthInterceptor extends Interceptor {
  var log = getLogger("AuthInterceptor");

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {}
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 403 || response.statusCode == 401) {}
    return handler.next(response);
  }

}

