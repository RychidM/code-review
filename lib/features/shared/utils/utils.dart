import 'package:internet_connection_checker/internet_connection_checker.dart';

class Utils {
  static Future<Enum> checkConnectivity() async {
    return await InternetConnectionChecker().connectionStatus;
  }
}
