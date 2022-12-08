import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:yogafx/model/model.dart';

class AppTranslations extends Translations {
  //Default Locale
  static final locale = Get.deviceLocale;

  //Fallback Locale
  static const fallbackLocale = Locale('en');

  //Supported Locales by the App
  static final supportedLocales = [const Locale('en')];

  // Total Languages
  static final langs = ['en'];

  //Total Locales
  static final locales = [const Locale('en')];

  @override
  Map<String, Map<String, String>> get keys => {'en': languageEnglish};

  //GET INIT LOCALE
  static Locale getInitialLocale() {
    bool localeCheck = Settings.getValue('isOnBoarding ', defaultValue: true)!;
    if (localeCheck) {
      return Get.deviceLocale!;
    } else {
      return Locale(Settings.getValue('pref-language', defaultValue: 'en')!);
    }
  }

  // CHANGING THE LOCALE
  void changeLoclae(String language) {
    final locale = _getLocaleFromLanguages(language);
    Get.updateLocale(locale);
  }

  _getLocaleFromLanguages(lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        return locales[i];
      }
    }
    return const Locale('en');
  }
}
