import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stock_savvy/features/auth/controller/auth_binding.dart';

import '../../generated/assets.dart';
import '../../shared/resources/app_colors.dart';
import '../../shared/resources/app_dimens.dart';
import '../../shared/resources/app_strings.dart';
import '../../shared/resources/app_text.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../utils/dimensions.dart';
import '../../utils/form_validator.dart';
import 'controller/auth_logic.dart';

class AuthView extends GetView<AuthLogic> {
  const AuthView({super.key});

  // GetX Controller

  @override
  Widget build(BuildContext context) {
    AuthBinding authBinding = AuthBinding();
    authBinding.dependencies();
    Dimensions.init(context);
    return Scaffold(
      body: _body,
    );
  }

  Stack get _body {
    return Stack(
      children: [
        _backgroundImage,
        _purpleBlurDot,
        _blueBlurDot,
        _appLogo,
        _authBodyContents,
        _getCurrentForm,
      ],
    );
  }

  Positioned get _appLogo {
    return Positioned(
        top: 0,
        left: Dimensions.getDynamicWidth(AppDimens.sPadding50),
        child: Row(
          children: [
            SizedBox(
              height: Dimensions.getDynamicHeight(AppDimens.sPadding120),
              width: Dimensions.getDynamicWidth(AppDimens.sPadding120),
              child: Image.asset(
                Assets.iconsStockAppLogo,
              ),
            ),
            // Gap(Dimensions.getDynamicWidth(AppDimens.sPadding5)),
            const AppText(
              text: AppStrings.sAppName,
              size: AppDimens.sPadding30,
            )
          ],
        ));
  }

  GetBuilder<AuthLogic> get _getCurrentForm {
    return GetBuilder<AuthLogic>(builder: (logic) {
      return logic.state.isSignUp ? _signUpForm : _signInForm;
    });
  }

  Opacity get _backgroundImage {
    return Opacity(
      opacity: .2,
      child: Image.asset(
        Assets.imagesSignInBgBanner,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Positioned get _blueBlurDot {
    return Positioned(
      left: Dimensions.getDynamicWidth(AppDimens.sPadding350),
      top: Dimensions.getDynamicHeight(AppDimens.sPadding200),
      child: Opacity(
        opacity: .8,
        child: Container(
          height: Dimensions.getDynamicHeight(AppDimens.sPadding305),
          width: Dimensions.getDynamicWidth(AppDimens.sPadding305),
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color(0xffD2ECF3),
              blurRadius: AppDimens.sPadding60,
              spreadRadius: AppDimens.sPadding30,
            ),
          ]),
        ),
      ),
    );
  }

  Positioned get _purpleBlurDot {
    return Positioned(
      left: Dimensions.getDynamicWidth(AppDimens.sPadding350),
      top: Dimensions.getDynamicHeight(AppDimens.sPadding200),
      child: Opacity(
        opacity: .4,
        child: Container(
          height: Dimensions.getDynamicHeight(AppDimens.sPadding280),
          width: Dimensions.getDynamicWidth(AppDimens.sPadding280),
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color(0xffB5C0EC),
              blurRadius: AppDimens.sPadding60,
              spreadRadius: AppDimens.sPadding60,
            ),
          ]),
        ),
      ),
    );
  }

  Widget get _authBodyContents {
    return Positioned(
      top: Dimensions.getDynamicHeight(AppDimens.sPadding280),
      left: Dimensions.getDynamicWidth(AppDimens.sPadding150),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleText,
              Gap(Dimensions.getDynamicHeight(AppDimens.sPadding60)),
              _taglineText,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _titleText {
    return GetBuilder<AuthLogic>(builder: (logic) {
      return AppText(
        text: logic.state.isSignUp
            ? AppStrings.sSignUpTitleText
            : AppStrings.sSignInTitleText,
        size: Dimensions.getDynamicHeight(AppDimens.sPadding55),
        color: Colors.black,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.justify,
      );
    });
  }

  Widget get _taglineText {
    return GetBuilder<AuthLogic>(builder: (logic) {
      return RichText(
        text: TextSpan(
          text: logic.state.isSignUp
              ? AppStrings.saSignUpSubTitleText
              : AppStrings.sSignInSubTitleText,
          style: GoogleFonts.notoSans(
            fontSize: Dimensions.getDynamicHeight(AppDimens.sPadding25),
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: logic.state.isSignUp
                    ? AppStrings.sLoginHereText
                    : AppStrings.sRegisterHereText,
                style: GoogleFonts.notoSans(
                  fontSize: Dimensions.getDynamicHeight(AppDimens.sPadding25),
                  color: AppColors.aPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = (() => controller.updateIsSignUp())),
          ],
        ),
      );
    });
  }

  Widget get _signInForm {
    return Positioned(
      top: Dimensions.getDynamicHeight(AppDimens.sPadding40),
      right: Dimensions.getDynamicWidth(AppDimens.sPadding70),
      bottom: Dimensions.getDynamicHeight(AppDimens.sPadding50),
      child: Container(
        padding:
            EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
        width: Dimensions.getDynamicWidth(AppDimens.sPadding500),
        height: double.maxFinite,
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Form(
            key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: 'Sign in as Admin'),
                _signInRoleSelector,
                Gap(Dimensions.getDynamicHeight(AppDimens.sPadding40)),
                _signInEmailInTextField,
                Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                _passwordTextField,
                Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                _recoverPasswordText,
                Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                _signInBtn,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container get _signInRoleSelector {
    return Container(
      height: Dimensions.getDynamicHeight(AppDimens.sPadding90),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.getDynamicWidth(AppDimens.sPadding5),
          vertical: Dimensions.getDynamicHeight(AppDimens.sPadding5)),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EFF2),
        borderRadius: BorderRadius.circular(
          Dimensions.getDynamicHeight(AppDimens.sPadding15),
        ),
      ),
      child: Stack(
        children: [
          GetBuilder<AuthLogic>(
            init: AuthLogic(),
            initState: (_) {},
            builder: (_) {
              return SlideTransition(
                position: controller.state.animationOffset,
                child: Container(
                  height: double.maxFinite,
                  width: Dimensions.getDynamicWidth(227),
                  decoration: BoxDecoration(
                    color: AppColors.sAppWhiteColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.getDynamicHeight(AppDimens.sPadding15),
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.slideToLeft(),
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        Dimensions.getDynamicHeight(AppDimens.sPadding15),
                      ),
                    ),
                    child: const Center(
                      child: AppText(
                        text: 'Admin',
                        size: AppDimens.sPadding25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.slideToRight(),
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        Dimensions.getDynamicHeight(AppDimens.sPadding15),
                      ),
                    ),
                    child: const Center(
                      child: AppText(
                        text: 'User',
                        size: AppDimens.sPadding25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _signUpForm {
    return Positioned(
      top: Dimensions.getDynamicHeight(AppDimens.sPadding100),
      right: Dimensions.getDynamicWidth(AppDimens.sPadding70),
      bottom: Dimensions.getDynamicHeight(AppDimens.sPadding50),
      child: Container(
        padding:
            EdgeInsets.all(Dimensions.getDynamicHeight(AppDimens.sPadding20)),
        width: Dimensions.getDynamicHeight(AppDimens.sPadding500),
        height: double.maxFinite,
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Form(
            key: _signUpFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _signUpFirstNameTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _signUpLastNameTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _signUpEmailInTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _phoneNumberTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _signUpPasswordTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _signUpConfirmPasswordTextField,
                  Gap(Dimensions.getDynamicHeight(AppDimens.sPadding25)),
                  _signUpBtn,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField get _signInEmailInTextField {
    return CustomTextField(
      controller: signInEmailController,
      onChange: (value) => controller.updateEmail(value.trim()),
      validator: FormValidator.requiredValidator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  CustomTextField get _signUpEmailInTextField {
    return CustomTextField(
      controller: signInEmailController,
      onChange: (value) => controller.updateEmail(value.trim()),
      validator: FormValidator.requiredValidator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  CustomTextField get _signUpLastNameTextField {
    return CustomTextField(
      controller: signUpLastNameController,
      hintText: AppStrings.sLastName,
      onChange: (String value) {
        controller.updateLastName(value.trim());
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      validator: FormValidator.requiredValidator,
    );
  }

  CustomTextField get _signUpFirstNameTextField {
    return CustomTextField(
      controller: signUpFirstNameController,
      hintText: AppStrings.sFullNameTxt,
      onChange: (String value) {
        controller.updateFirstName(value.trim());
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      validator: FormValidator.requiredValidator,
    );
  }

  CustomTextField get _passwordTextField {
    return CustomTextField(
      controller: signInPasswordController,
      onChange: (value) => controller.updatePassword(value.trim()),
      hintText: AppStrings.sPasswordText,
      obscureText: controller.state.isHidePassword,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      suffixIcon: GestureDetector(
        onTap: () => controller.togglePasswordOnOff(),
        child: Image.asset(
          Assets.iconsHidePassword,
          scale: 3.5,
          height: Dimensions.getDynamicHeight(AppDimens.sPadding12),
        ),
      ),
      validator: FormValidator.requiredValidator,
    );
  }

  Widget get _phoneNumberTextField {
    return GestureDetector(
      child: CustomTextField(
        controller: phoneNumberController,
        keyboardType: const TextInputType.numberWithOptions(),
        onChange: (String value) {
          controller.updatePhoneNumber(value.trim());
        },
        hintText: AppStrings.sPhoneNumber,
        suffixIcon: Image.asset(
          Assets.iconsArrowDown,
          scale: 6,
        ),
        validator: FormValidator.requiredValidator,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget get _signUpPasswordTextField {
    return CustomTextField(
      controller: signUpPasswordController,
      onChange: (String value) {},
      hintText: AppStrings.sPasswordText,
      obscureText: controller.state.isHidePassword,
      validator: FormValidator.passwordValidator,
      textInputAction: TextInputAction.next,
    );
  }

  CustomTextField get _signUpConfirmPasswordTextField {
    return CustomTextField(
      controller: signUpConfirmPasswordController,
      onChange: (String value) {
        controller.updatePassword(value.trim());
      },
      hintText: AppStrings.sConfirmPasswordText,
      obscureText: controller.state.isHidePassword,
      suffixIcon: GestureDetector(
        onTap: () => controller.togglePasswordOnOff(),
        child: Image.asset(
          Assets.iconsHidePassword,
          scale: 3.5,
          height: Dimensions.getDynamicHeight(AppDimens.sPadding12),
        ),
      ),
      validator: FormValidator.requiredValidator,
      textInputAction: TextInputAction.go,
    );
  }

  Widget get _recoverPasswordText {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppText(
            text: AppStrings.sRecoverPasswordText,
            size: Dimensions.getDynamicHeight(AppDimens.sPadding15),
            color: Colors.grey,
            textAlign: TextAlign.justify,
          ),
          Gap(Dimensions.getDynamicWidth(AppDimens.sPadding25)),
        ],
      ),
    );
  }

  SimpleShadow get _signInBtn {
    return SimpleShadow(
      color: AppColors.aPrimaryColor,
      opacity: .7,
      sigma: 14,
      offset: const Offset(2, 8),
      child: InkWell(
        onTap: () => controller.signIn(_signInFormKey),
        child: Container(
          height: Dimensions.getDynamicHeight(AppDimens.sPadding70),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  Dimensions.getDynamicHeight(AppDimens.sPadding15)),
              color: AppColors.aPrimaryColor),
          child: Center(
            child: Obx(() => !controller.state.isLoading
                ? AppText(
                    text: AppStrings.sSignInText,
                    size: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                    color: Colors.white,
                  )
                : SpinKitThreeBounce(
                    size: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                    color: AppColors.sAppWhiteColor)),
          ),
        ),
      ),
    );
  }

  SimpleShadow get _signUpBtn {
    return SimpleShadow(
      color: AppColors.aPrimaryColor,
      opacity: .7,
      sigma: 14,
      offset: const Offset(2, 8),
      child: InkWell(
        onTap: () {
          controller.signUp(_signUpFormKey);
        },
        child: Container(
          height: Dimensions.getDynamicHeight(AppDimens.sPadding70),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  Dimensions.getDynamicHeight(AppDimens.sPadding15)),
              color: AppColors.aPrimaryColor),
          child: Center(
            child: Obx(
              () => !controller.state.isLoading
                  ? AppText(
                      text: AppStrings.sSignUpText,
                      size: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                      color: AppColors.sAppWhiteColor,
                    )
                  : SpinKitThreeBounce(
                      size: Dimensions.getDynamicHeight(AppDimens.sPadding20),
                      color: AppColors.sAppWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

//form keys
final _signInFormKey = GlobalKey<FormState>();
final _signUpFormKey = GlobalKey<FormState>();

//Text Controllers
final TextEditingController signInEmailController = TextEditingController();
final TextEditingController signUpLastNameController = TextEditingController();
final TextEditingController signUpFirstNameController = TextEditingController();
final TextEditingController signInPasswordController = TextEditingController();
final TextEditingController signUpPasswordController = TextEditingController();
final TextEditingController signUpConfirmPasswordController =
    TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
