import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String KEY_USER_NAME = "userName";

class SharedPrefsManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getSavedUserName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(KEY_USER_NAME) ?? "AnnaBersh";
  }

  Future<bool> saveUserName(String userName) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(KEY_USER_NAME, userName);
  }
}