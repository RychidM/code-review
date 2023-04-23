import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stock_savvy/features/auth/auth_view.dart';

import '../../data/local/secure_storage.dart';
import '../../generated/assets.dart';
import '../../utils/constants.dart';
import 'package:page_transition/page_transition.dart';

import 'onboarding_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen.withScreenFunction(
      splash: Image.asset(Assets.imagesAppLogo),
      splashIconSize: 200,
      duration: Constants.aSplashScreenTime,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      screenFunction: () => _checkFirstTimeStatus(),
    ));
  }

  Future<Widget> _checkFirstTimeStatus() async {
    var secureStorage = SecureStorage();
    var isFirstTime = await secureStorage.isFirstTime();

    if (isFirstTime == 'true') {
      return const OnBoardingView();
    } else {
      return const AuthView();
    }
  }
}
