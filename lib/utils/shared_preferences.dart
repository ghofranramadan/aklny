import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopSharedPreference {
  static SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    @required String key,
    @required dynamic value,
  }) async {
    if (value is bool) return await prefs.setBool(key, value);
    if (value is String) return await prefs.setString(key, value);
    if (value is int)
      return await prefs.setInt(key, value);
    else
      return await prefs.setDouble(key, value);
  }

  static dynamic getData({
    @required String key,
  }) {
    return prefs.get(key);
  }

  static Future<bool> removeData({
    @required String key,
  }) async {
    return await prefs.remove(key);
  }
}
