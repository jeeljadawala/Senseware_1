import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:senseware/shared_pref.dart';

import 'supported_locale.dart';


final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(Locale('en')) {
    onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      AppSharedPreference.saveLocale(locale);
      state = Locale(locale.code);
    } catch (error) {
      state = Locale('en');
    }
  }

  void onAppStart() {
    try {
      final locale = AppSharedPreference.getLocale();
      state = locale;
    } catch (error) {
      state = Locale('en');
    }
  }
}