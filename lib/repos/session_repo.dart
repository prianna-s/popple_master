import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:popple/Models/user_details.dart';
import 'package:popple/repos/setting_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


//TODO: ==============Session Crud======================

Future CreateSession(data,isLogin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool("isLogin", isLogin);
   prefs.setString('data', jsonEncode(data));
}
Future<UserDetails>getSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("session ${prefs.getString('data')}");
  UserDetails details=UserDetails.fromJson(jsonDecode(prefs.getString('data')??"{}"));
  auth.value=details;
  return details;
}

setSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLogin', true);
}


Logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', false);
}
Future<bool> isLogin() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isLogin")??false;
  }

const String prefSelectedLanguageCode = "SelectedLanguageCode";

void setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);
  Locale ll=_locale(languageCode);

}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  print('languageCode ${systemLocales.first.languageCode}');
  String languageCode = _prefs.getString(prefSelectedLanguageCode) ?? systemLocales.first.languageCode;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : Locale(systemLocales.first.languageCode, '');
}



