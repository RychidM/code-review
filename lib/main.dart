import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:stock_savvy/shared/resources/app_theme.dart';
import 'package:stock_savvy/utils/constants.dart';
import 'package:stock_savvy/utils/routing/route_constants.dart';

import 'utils/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: InAppNotification(
        child: GetMaterialApp(
          key: ContextHolder.key,
          debugShowCheckedModeBanner: false,
          title: 'Stock Savvy',
          initialRoute: RouteConstants.sInitialRoute,
          getPages: AppRoutes.appViews,
          theme: AppTheme.appTheme,
        ),
      ),
    );
  }
}
