import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_savvy/features/auth/controller/auth_state.dart';
import 'package:stock_savvy/features/auth/models/admin_auth_model.dart';
import 'package:stock_savvy/features/auth/models/user_auth_model.dart';
import 'package:stock_savvy/features/auth/repo/auth_repository.dart';
import 'package:stock_savvy/features/auth/utils/auth_utils.dart';
import 'package:stock_savvy/shared/resources/app_dimens.dart';
import 'package:stock_savvy/utils/routing/route_constants.dart';

import '../../../shared/resources/app_strings.dart';
import '../../../utils/dialogs.dart';
import '../../shared/utils/utils.dart';
import '../auth_view.dart';
import '../models/sign_up_error_model.dart';

class AuthLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final state = AuthState();
  final AuthRepo _authRepo = AuthRepo();

  @override
  void onInit() {
    super.onInit();

    /// controls the admin user selector on the sign in view
    state.slideAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: AppDimens.sDuration150),
    );
    state.animationOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
        parent: state.slideAnimationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    state.slideAnimationController.dispose();
    super.dispose();
  }

  void slideToRight() {
    state.identifier = Identifier.user;
    state.slideAnimationController.forward();
  }

  void slideToLeft() {
    state.identifier = Identifier.admin;
    state.slideAnimationController.reverse();
  }

  updatePassword(String password) {
    state.password = password;
  }

  updateFirstName(String fullName) {
    state.firstName = fullName;
  }

  updateLastName(String lastName) {
    state.lastName = lastName;
  }

  updatePhoneNumber(String phoneNumber) {
    state.phoneNumber = phoneNumber;
  }

  updateEmail(String email) {
    state.email = email;
  }

  updateIsSignUp() {
    state.isSignUp = !state.isSignUp;
    update();
  }

  togglePasswordOnOff() {
    state.isHidePassword = !state.isHidePassword;
    update();
  }

  // Sign up functionality

  signUp(GlobalKey<FormState> formKey) async {
    state.isLoading = true;
    Map<String, dynamic> payload = AdminInfo(
            firstName: state.firstName,
            lastName: state.lastName,
            password: state.password,
            email: state.email,
            phoneNumber: state.phoneNumber)
        .toJson();
    if (formKey.currentState!.validate()) {
      switch (await Utils.checkConnectivity()) {
        case InternetConnectionStatus.connected:
          Object user = await _authRepo.signUp(payload);
          _checkCurrentRuntime(user);
          break;
        case InternetConnectionStatus.disconnected:
          state.isLoading = false;
          Dialogs.showNoInternetSnackbar();
          break;
      }
    }
    state.isLoading = false;
  }

  // Sign in functionality

  signIn(GlobalKey<FormState> formKey) async {
    state.isLoading = true;

    Map<String, dynamic> userInfo = UserInfo(
      email: state.email,
      password: state.password,
    ).toJson();

    if (formKey.currentState!.validate()) {
      switch (await Utils.checkConnectivity()) {
        case InternetConnectionStatus.connected:
          var user = await _authRepo.signIn(userInfo, state.identifier);
          _checkCurrentRuntime(user);
          break;
        case InternetConnectionStatus.disconnected:
          state.isLoading = false;
          Dialogs.showNoInternetSnackbar();
          break;
      }
    }
    state.isLoading = false;
  }





  void _checkCurrentRuntime(Object user) {
    switch (user.runtimeType) {
      case UserInfo:
        state.isLoading = false;
        state.userInfo = user as UserInfo;
        _clearTextFields();
        if (state.isSignUp) {
          updateIsSignUp();
          break;
        } else {
          Get.offNamed(RouteConstants.sHomeRoute, arguments: state.userInfo);
          break;
        }
      case AdminInfo:
        state.isLoading = false;
        state.adminInfo = user as AdminInfo;
        _clearTextFields();
        Get.offNamed(RouteConstants.sHomeRoute, arguments: state.adminInfo);
        break;
      case SignupErrorModel:
        state.isLoading = false;
        SignupErrorModel errorResponse = user as SignupErrorModel;
        Dialogs.showToast(msg: errorResponse.respDesc.toString());
        break;
      default:
        state.isLoading = false;
        Dialogs.showToast(msg: AppStrings.sInvalidEmailPasswordTxt);
        break;
    }
  }

  
  void _clearTextFields() {
    phoneNumberController.text = '';
    signUpConfirmPasswordController.text = '';
    signUpLastNameController.text = '';
    signInEmailController.text = '';
    signUpFirstNameController.text = '';
    signUpPasswordController.text = '';
  }


  @override
  void onClose() {
    state.slideAnimationController.dispose();
    super.onClose();
  }
}
