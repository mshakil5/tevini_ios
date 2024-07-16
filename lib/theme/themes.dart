import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xFF0E7074);
  static const Color scaffoldColor = Color(0xFFF6F7F9);
  static const scaffoldColorDark = Color(0xFF000000);

  static final InputDecorationTheme _kInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: primaryColor.withOpacity(0.5),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: primaryColor)),
    filled: true,
    fillColor: primaryColor.withOpacity(0.15),
  );

  static final OutlinedButtonThemeData _kOutlineButtoneThemeData =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ),
  );

  //*****************************************************/

  static ThemeData LIGHT_THEME = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(backgroundColor: AppThemes.primaryColor),
    primaryColor: AppThemes.primaryColor,
    scaffoldBackgroundColor: AppThemes.scaffoldColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppThemes.primaryColor,
    ),
    inputDecorationTheme: _kInputDecorationTheme,
    switchTheme:
        SwitchThemeData(thumbColor: MaterialStateProperty.all(Colors.teal)),
    outlinedButtonTheme: _kOutlineButtoneThemeData,
  );

  static ThemeData DARK_THEME = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(backgroundColor: scaffoldColorDark),
    primaryColor: AppThemes.primaryColor,
    scaffoldBackgroundColor: scaffoldColorDark,
    inputDecorationTheme: _kInputDecorationTheme,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppThemes.primaryColor,
    ),
    switchTheme:
        SwitchThemeData(thumbColor: MaterialStateProperty.all(Colors.teal)),
    outlinedButtonTheme: _kOutlineButtoneThemeData,
  );
}
