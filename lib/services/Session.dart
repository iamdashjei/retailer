import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wstar_retailer/models/dito_user.dart';

class Session{
  static Future<SharedPreferences> _sharedPreference() async {
    return SharedPreferences.getInstance();
  }

  static Future<bool> isVerified() async {
    SharedPreferences _prefs = await _sharedPreference();
    final status = _prefs.getBool("verified") ?? false;
    return status;
  }

  static setVerified({@required bool isVerified}) async {
    SharedPreferences _prefs = await _sharedPreference();
    _prefs.setBool("verified", isVerified);
  }

  static setDitoUserDetails({@required String user}) async {
    SharedPreferences _prefs = await _sharedPreference();
    _prefs.setString("ditoUser", user);
  }

  static Future<DitoUser> getDitoUserDetails() async {
    SharedPreferences _prefs = await _sharedPreference();
    var data = json.decode(_prefs.getString("ditoUser"));
    DitoUser info = DitoUser.fromJson(data);

    //Map<String, dynamic> fromUserString = json.decode(_prefs.getString("ditoUser"));
    return info;
  }

  static setToken({@required String tokenAPI}) async {
    SharedPreferences _prefs = await _sharedPreference();
    _prefs.setString("token", tokenAPI);
  }

  static Future<String> getToken() async {
    SharedPreferences _prefs = await _sharedPreference();
    final token = _prefs.getString("token") ?? "";
    return token;
  }
}