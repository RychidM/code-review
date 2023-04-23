import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:stock_savvy/features/shared/notifications/utils/notification_utils.dart';
import 'package:stock_savvy/network/api_constants.dart';
import 'package:stock_savvy/network/exception_constants.dart';
import 'package:stock_savvy/network/network_exceptions.dart';
import 'package:stock_savvy/utils/logger.dart';

class ApiService extends GetConnect {
  var log = getLogger('ApiService');
  @override
  void onInit() {
    // var headers = {SApiConstants.aAuth: SApiConstants.aApiKey};
    // httpClient.addAuthenticator<dynamic>((Request<Object?> request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });

    super.onInit();
  }

  final GetConnect _getConnect = GetConnect()
    ..baseUrl = SApiConstants.sBaseUrl
    ..timeout = const Duration(
      milliseconds: Exceptions.connectTimeout,
    );

  Future<Response> postReq(String url, {Map<String, dynamic>? payload}) async {
    Response? response;
    try {
      response = await _getConnect.post(
        url,
        payload,
      );
      return response;
    } on SocketException {
      throw FetchDataException(SApiConstants.aNoInternet);
    } on FormatException {
      throw const FormatException(SApiConstants.aUnableToProcess);
    } on Exception {
      Response res = _errorHandling(response!);
      return res;
    }
  }

  Future<Response> getReq(String url, {Map<String, dynamic>? payload}) async {
    Response? response;
    try {
      response = await _getConnect.get(
        url,
        query: payload,
      );
      return response;
    } on SocketException {
      throw FetchDataException(SApiConstants.aNoInternet);
    } on FormatException {
      throw const FormatException(SApiConstants.aUnableToProcess);
    } on Exception {
      _errorHandling(response!);
      rethrow;
    }
  }

  dynamic _errorHandling(Response response) {
    switch (response.statusCode) {
      case 200:
      case 400:
        return Exceptions.dioInvalidRequestMsg;
      case 401:
        return Exceptions.dioUnauthorizedMsg;
      case 403:
        if (response.body != null) {
          throw FetchDataException(Exceptions.dioErrorOccurredMsg);
        } else {
          throw BadRequestException(Exceptions.dioErrorOccurredMsg);
        }
      case 404:
        return response;
      case 422:
        return response;
      case 500:
      NotificationUtils.showErrorOccurredNotification();
        throw InternalServerErrorException(
            Exceptions.dioInternatServerExceptionMsg);
      default:
      NotificationUtils.showErrorOccurredNotification();
        throw FetchDataException(Exceptions.dioServerErrorOccurredMsg);
    }
  }
}
