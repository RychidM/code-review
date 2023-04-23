import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/features/auth/utils/auth_utils.dart';

import '../models/admin_auth_model.dart';
import '../models/user_auth_model.dart';

class AuthState {
  /// [slideAnimationController] controls the animation for sign in as
  /// admin or sign in as user.
  late AnimationController slideAnimationController;

  /// [animationOffset] controls the current position of
  /// sign in as admin or user the slider.
  late Animation<Offset> animationOffset;

  /// [adminInfo] holds the value of the signed in user
  /// might remove this in the future because it is potentially unused
  final Rx<AdminInfo> _adminInfo = AdminInfo().obs;
  AdminInfo get adminInfo => _adminInfo.value;
  set adminInfo(AdminInfo value) => _adminInfo.value = value;

  /// [userInfo] holds the value of the signed in user
  final Rx<UserInfo> _userInfo = UserInfo().obs;
  UserInfo get userInfo => _userInfo.value;
  set userInfo(UserInfo value) => _userInfo.value = value;

  final RxBool _isSignUp = false.obs;
  bool get isSignUp => _isSignUp.value;
  set isSignUp(bool value) => _isSignUp.value = value;

  final RxBool _isHidePassword = false.obs;
  bool get isHidePassword => _isHidePassword.value;
  set isHidePassword(bool value) => _isHidePassword.value = value;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  String password = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  Identifier identifier = Identifier.admin;
}
