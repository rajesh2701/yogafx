import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorsTheme {
  static Color primaryColor = const Color(0xFFE7E8EA);
  static Color accentColor = const Color(0xFF6EBE45);
  static Color bgPrimary = const Color(0xFFFFF1E8);
  static Color white = const Color(0xFFE7E8EA);
  static Color black = const Color(0xFF000000);
  static Color subtextBlack = const Color(0xFF474747);
  static Color trackColor = const Color(0xFF757575);
  static Color styleTopColor = const Color(0x70000000);
  static Color restcardcolor = const Color.fromRGBO(224, 92, 112, .7);
  static Color materialCardcolor = const Color.fromRGBO(224, 92, 112, .4);
  static Color testcolor = const Color.fromRGBO(255, 255, 255, .3);
  static Color cardColorWhite = const Color(0XFFF1F1F1);
  static Color cardColorBlack = const Color(0xFF474747);
  static Color circleColor = const Color.fromRGBO(110, 190, 69, .5);
  static Color red = const Color(0xFFFF0000);
  static const Color violet = Color(0xFF8764C3);
  static const Color violetShade1 = Color(0xFFB9A7D9);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColorsTheme.white,
    textTheme:
        GoogleFonts.comfortaaTextTheme().apply(bodyColor: AppColorsTheme.black),
    primaryColor: AppColorsTheme.white,
    hintColor: AppColorsTheme.white,
    sliderTheme: SliderThemeData(
        thumbColor: AppColorsTheme.accentColor,
        activeTrackColor: AppColorsTheme.accentColor,
        inactiveTrackColor: AppColorsTheme.trackColor),
    colorScheme: ColorScheme.light(
            secondary: AppColorsTheme.accentColor, brightness: Brightness.light)
        .copyWith(secondary: AppColorsTheme.accentColor),
    // color for appbar in home page
    errorColor: AppColorsTheme.red,
    cardColor: AppColorsTheme.cardColorWhite,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColorsTheme.accentColor,
        foregroundColor: AppColorsTheme.white,
        titleTextStyle: TextStyle(
            color: AppColorsTheme.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: AppColorsTheme.white)),
  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColorsTheme.black,
      textTheme: GoogleFonts.comfortaaTextTheme()
          .apply(bodyColor: AppColorsTheme.white),
      primaryColor: AppColorsTheme.black,
      hintColor: AppColorsTheme.white,
      sliderTheme: SliderThemeData(
          thumbColor: AppColorsTheme.accentColor,
          activeTrackColor: AppColorsTheme.accentColor,
          inactiveTrackColor: AppColorsTheme.subtextBlack),
      colorScheme: ColorScheme.dark(
              secondary: AppColorsTheme.accentColor,
              brightness: Brightness.dark)
          .copyWith(secondary: AppColorsTheme.accentColor),
      // color for appbar in home page
      errorColor: AppColorsTheme.red,
      cardColor: AppColorsTheme.cardColorBlack,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColorsTheme.accentColor,
          foregroundColor: AppColorsTheme.white,
          titleTextStyle: TextStyle(
              color: AppColorsTheme.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: AppColorsTheme.white))
      //THEME COMPLETE HERE
      );
}

// DYNAMIC THEME CHANGER CLASS
class MyTheme with ChangeNotifier {
  static bool _isDark = false;

  MyTheme() {
    _isDark = Settings.getValue('easyTheme', defaultValue: false)!;
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> switchTheme() async {
    _isDark = !_isDark;
    // Settings.setValue('easyTheme', _isDark);
    await Settings.setValue<bool>('easyTheme', _isDark, notify: true);
    notifyListeners();
  }

  void resetTheme() {
    _isDark = false;
    notifyListeners();
  }
}
