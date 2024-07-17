import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
       // _supportedColorScheme[_appTheme] ??
            ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      appBarTheme: AppBarTheme(color: Colors.teal),
      scaffoldBackgroundColor: appTheme.whiteA700,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primaryContainer,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray200,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 34.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 28.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 24.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 17.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Darker Grotesque',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF30A89D),
    primaryContainer: Color(0XFF003057),
    secondary: Color(0XFF003057),
     secondaryContainer: Color(0XFF30A89D),
    tertiary: Color(0XFF003057),
    tertiaryContainer: Color(0XFF30A89D),

    // Background colors
    background:Colors.teal,
    //Color(0XFF003057),

    // Surface colors
   // surface: Color(0XFF003057),
    surfaceTint: Color(0XFF121212),
    //surfaceVariant: Color(0XFF30A89D),

    // Error colors
    error: Color(0XFF121212),
    errorContainer: Color(0XFF5A5A5A),
    onError: Color(0XFF18988B),
    onErrorContainer: Color(0XFF121212),

    // On colors(text colors)
    onBackground: Color(0XFFE3E3E3),
    onInverseSurface: Color(0XFF18988B),
    onPrimary: Color(0XFF121212),
    onPrimaryContainer: Color(0XFFE3E3E3),
    onSecondary: Color(0XFFE3E3E3),
    onSecondaryContainer: Color(0XFF121212),
    onTertiary: Color(0XFFE3E3E3),
    onTertiaryContainer: Color(0XFF121212),

    // Other colors
    outline: Color(0XFF121212),
    outlineVariant: Color(0XFF003057),
    scrim: Color(0XFF003057),
    shadow: Color(0XFF121212),

    // Inverse colors
    inversePrimary: Color(0XFF003057),
    inverseSurface: Color(0XFF121212),

    // Pending colors
    onSurface: Color(0XFFE3E3E3),
    onSurfaceVariant: Color(0XFF121212),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray10001 => Color(0XFFCFCFCF);
  Color get blueGray30067 => Color(0X67A0A2B3);
  Color get blueGray400 => Color(0XFF898989);
  Color get blueGray40001 => Color(0XFF888888);

  // Gray
  Color get gray200 => Color(0XFFE8E8E8);
  Color get gray400 => Color(0XFFB8B8B8);
  Color get gray50 => Color(0XFFF5FFFE);
  Color get gray800 => Color(0XFF414141);
  Color get gray900 => Color(0XFF2A2A2A);

  // Green
  Color get green600 => Color(0XFF43A048);

  // Indigo
  Color get indigo50 => Color(0XFFEAEBFF);

  // Orange
  Color get orange300 => Color(0XFFFFA45A);

  // Red
  Color get red500 => Color(0XFFF44336);

  // Teal
  Color get teal200 => Color(0XFF83CCC6);
  Color get teal300 => Color(0XFF52B8AF);
  Color get teal50 => Color(0XFFE1F2F1);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellow60028 => Color(0X28FDD835);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
