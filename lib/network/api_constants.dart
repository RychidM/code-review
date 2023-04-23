import 'package:flutter_dotenv/flutter_dotenv.dart';

class SApiConstants {
  SApiConstants._();

  static String aApiKey = dotenv.get('API_KEY');
  static String sBaseUrl = dotenv.get('API_BASE_URL');

  /*---------- Endpoints -----------*/
  static const String sSignUp = "v1/signup";
  static const String sAdminSignIn = "v1/login/admin";
  static const String sUserSignIn = "v1/login/user";
  static const String sAddUser = "v1/user";
  static const String sWarehouse = "v1/warehouse";
  static const String sGetAllWarehouses = "v1/warehouse/all";


  /*-------- Basic Strings ---------*/
  static const aAuth = "authorization";
  static const aNoInternet = "No Internet";
  static const aUnableToProcess = "Unable to process";
}
