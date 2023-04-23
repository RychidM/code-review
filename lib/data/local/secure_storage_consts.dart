import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecureStorageConstants{
  static String aDbPathString = dotenv.get('APP_DB_PATH_KEY');
  static String aIsFirstTimeKey = 'first_time';
}