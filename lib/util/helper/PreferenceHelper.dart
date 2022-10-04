import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

// Ref: https://stackoverflow.com/questions/58389285/how-to-create-singleton-class-of-sharedpreferences-in-flutter
class PreferenceHelper {
  // ignore: non_constant_identifier_names
  static String PREF_KEY_USER_TOKEN_CACHE = "user_token";

  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async => _instance = await SharedPreferences.getInstance();

  //#region Getter
  static String getString(String key, [String defValue = ""]) => _instance.getString(key) ?? defValue;

  static bool getBool(String key) => _instance.getBool(key) ?? false;

  //#endregion

  //#region Setter
  static Future<bool> setBool(String key, bool value) => _instance.setBool(key, value);

  static Future<bool> setString(String key, String value) => _instance.setString(key, value);
//#endregion
}
