import 'package:stock_savvy/features/auth/models/admin_auth_model.dart';
import 'package:stock_savvy/features/auth/models/sign_in_error_model.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';
import 'package:stock_savvy/network/api_constants.dart';
import 'package:stock_savvy/network/dio_client.dart';
import 'package:stock_savvy/features/auth/utils/auth_utils.dart';
import 'package:stock_savvy/utils/logger.dart';

import '../../../network/get_api_service.dart';
import '../models/sign_up_error_model.dart';

/// TODO: remove all logs when ready to go live
class AuthRepo {
  var log = getLogger('AuthRepo');

  final DioClient _dioClient = DioClient();
  final ApiService _apiService = ApiService();
  late String respCode;
  late UserInfo _userInfo;

  Future<Object> signUp(Map<String, dynamic> payload) async {
    try {
      final request =
          await _apiService.postReq(SApiConstants.sSignUp, payload: payload);
      respCode = request.body['resp_code'];

      if (respCode == AuthUtils.respCodes[RespCodes.success]) {
        _userInfo = userInfoFromJson(request.body['data']);
        return _userInfo;
      } else {
        return SignupErrorModel.fromJson(request.body);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<Object> addUser(Map<String, dynamic> payload) async {
    try {
      final request =
          await _dioClient.post(SApiConstants.sAddUser, data: payload);

      respCode = request.data['resp_code'];

      if (respCode == AuthUtils.respCodes[RespCodes.success]) {
        _userInfo = userInfoFromJson(request.data['data']);
        log.e(_userInfo.toString());
        return _userInfo;
      } else {
        return SignInErrorModel.fromJson(request.data);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  Future<Object> signIn(
      Map<String, dynamic> payload, Identifier identifier) async {
    try {
      final request = await _apiService
          .postReq(AuthUtils.getEndpoint(identifier), payload: payload);

      respCode = request.body['resp_code'];

      if (respCode == AuthUtils.respCodes[RespCodes.success]) {
        _userInfo = userInfoFromJson(request.body['data']);
        log.e(_userInfo);
        return _userInfo;
      } else {
        return SignInErrorModel.fromJson(request.body);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
