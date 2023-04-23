import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stock_savvy/network/api_constants.dart';

// import '../data/local/secure_storage.dart';
import '../utils/logger.dart';
import 'auth_interceptor.dart';
import 'exception_constants.dart';
import 'network_exceptions.dart';
import 'network_logging.dart';

class DioClient {
  var log = getLogger('DioClient');
  // final _localStorage = SecureStorage();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: SApiConstants.sBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Exceptions.connectTimeout,
        receiveTimeout: Exceptions.receiveTimeout),
  )..interceptors.addAll([AuthInterceptor(), NetworkLogging()]);

  Dio get dio => _dio;

// GET request
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException {
      throw FetchDataException(Exceptions.dioNoInternetMsg);
    } on FormatException {
      throw FetchDataException(Exceptions.dioUnableToProcessMsg);
    } on DioError catch (e) {
      _parseError(e);
      rethrow;
    }
  }

// POST request
  Future<Response> post(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException {
      throw FetchDataException(SApiConstants.aNoInternet);
    } on FormatException {
      throw FetchDataException(SApiConstants.aUnableToProcess);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response && e.response?.statusCode == 422 ||
          e.response?.statusCode == 404) {
        return e.response!;
      } else {
        _parseError(e);
        rethrow;
      }
    }
  }

  /*
  * handling various error status codes
  * */
  dynamic _parseError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.response:
        log.d('**********RESPONSE************');
        _parseErrorResponse(dioError);
        break;
      case DioErrorType.connectTimeout:
        log.d('**********CONNECTION***********');
        throw FetchDataException(Exceptions.dioConnectionTimeoutMsg);
      case DioErrorType.sendTimeout:
        log.d('**********SEND************');
        throw FetchDataException(Exceptions.dioReceiveTimeoutMsg);
      case DioErrorType.receiveTimeout:
        log.d('**********RECEIVE************');
        throw FetchDataException(Exceptions.dioReceiveTimeoutMsg);
      case DioErrorType.cancel:
        log.d('**********CANCEL************');
        throw FetchDataException(Exceptions.dioCancelRequestMsg);
      case DioErrorType.other:
        log.d('**********OTHERS************');
        throw BadRequestException(Exceptions.dioErrorOccurredMsg);
      default:
        throw BadRequestException(Exceptions.dioErrorOccurredMsg);
    }
  }

  /*
  * Handling an error with status code other than 200 and a response data
  * */
  dynamic _parseErrorResponse(DioError dioError) {
    final response = dioError.response;
    switch (response!.statusCode) {
      case 200:
      case 400:
        return Exceptions.dioInvalidRequestMsg;
      case 401:
        return Exceptions.dioUnauthorizedMsg;
      case 403:
        if (response.data != null) {
          throw FetchDataException(Exceptions.dioErrorOccurredMsg);
        } else {
          throw BadRequestException(Exceptions.dioErrorOccurredMsg);
        }
      case 500:
        throw InternalServerErrorException(
            Exceptions.dioInternatServerExceptionMsg);
      default:
        throw FetchDataException(Exceptions.dioServerErrorOccurredMsg);
    }
  }
}
