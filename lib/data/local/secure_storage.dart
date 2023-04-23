import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_savvy/data/local/secure_storage_consts.dart';

class SecureStorage {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage _storage;

  SecureStorage() {
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future writeSecureData(String key, dynamic value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future writeSecureObject(String key, Object value) async {
    var writeData = await _storage.write(
        key: key, value: const JsonEncoder().convert(value));
    return writeData;
  }

  Future readSecureData(String key) async{
    var readData = await _storage.read(key: key);
    return readData ?? '';
  }

  Future readSecureObject(String key) async {
    var readData = await _storage.read(key: key);
    if (readData!=null) {
      return const JsonDecoder().convert(readData);
    } else {
      return null;
    }
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future isFirstTime() async {
    String? readData = await _storage.read(key: SecureStorageConstants.aIsFirstTimeKey);
    if(readData == null){
      _storage.write(key: SecureStorageConstants.aIsFirstTimeKey, value: 'false');
    }
    return readData ?? "true";
  }
}