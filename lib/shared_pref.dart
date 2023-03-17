import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:senseware/supported_locale.dart';

class AppSharedPreference{

  static SharedPreferences sharedPreference=AppSharedPreference.sharedPreference;

  static const _LOCALE_KEY = 'locale';

  static Future init()async{
    sharedPreference = await SharedPreferences.getInstance();
  }

  static void saveLocale(SupportedLocale locale){
    sharedPreference.setString(_LOCALE_KEY, locale.code);
  }

  static Locale getLocale(){
    final String localeCode = sharedPreference.get(_LOCALE_KEY).toString() ?? '';
    if(localeCode.isEmpty)throw 'Locale not found';
    return Locale(localeCode);
  }
}