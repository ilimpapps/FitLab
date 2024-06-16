// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color white8;
  late Color orange;
  late Color purpleLight;
  late Color white40;
  late Color divider;
  late Color orangeLight;
  late Color overlay;
  late Color blueLight;
  late Color black40;
  late Color greenLight;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFE6FC70);
  late Color secondary = const Color(0xFF8170FD);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF9B9BA9);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xB3FFFFFF);
  late Color primaryBackground = const Color(0xFF060409);
  late Color secondaryBackground = const Color(0xFF1E1E1E);
  late Color accent1 = const Color(0xFF393939);
  late Color accent2 = const Color(0xFF1D1C1F);
  late Color accent3 = const Color(0xFF4B4A63);
  late Color accent4 = const Color(0xFF59586F);
  late Color success = const Color(0xFF18E318);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFE2A2A);
  late Color info = const Color(0xFFFFFFFF);

  late Color white8 = const Color(0x15FFFFFF);
  late Color orange = const Color(0xFFFB973A);
  late Color purpleLight = const Color(0xFFB5ABFF);
  late Color white40 = const Color(0x66FDFDFD);
  late Color divider = const Color(0x1EFFFFFF);
  late Color orangeLight = const Color(0xFFF0BA92);
  late Color overlay = const Color(0xCD000000);
  late Color blueLight = const Color(0xFF99F0D0);
  late Color black40 = const Color(0x65060409);
  late Color greenLight = const Color(0xFF05B994);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'NTSomic';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get displayMediumFamily => 'NTSomic';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get displaySmallFamily => 'NTSomic';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
      );
  String get headlineLargeFamily => 'NTSomic';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
      );
  String get headlineMediumFamily => 'NTSomic';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
      );
  String get headlineSmallFamily => 'NTSomic';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
      );
  String get titleLargeFamily => 'NTSomic';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
      );
  String get titleMediumFamily => 'NTSomic';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 40.0,
      );
  String get titleSmallFamily => 'NTSomic';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );
  String get labelLargeFamily => 'NTSomic';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 26.0,
      );
  String get labelMediumFamily => 'NTSomic';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      );
  String get labelSmallFamily => 'NTSomic';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      );
  String get bodyLargeFamily => 'NTSomic';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'NTSomic';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'NTSomic';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'NTSomic',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFE6FC70);
  late Color secondary = const Color(0xFF8170FD);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF9B9BA9);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xB3FFFFFF);
  late Color primaryBackground = const Color(0xFF060409);
  late Color secondaryBackground = const Color(0xFF1E1E1E);
  late Color accent1 = const Color(0xFF393939);
  late Color accent2 = const Color(0xFF1D1C1F);
  late Color accent3 = const Color(0xFF4B4A63);
  late Color accent4 = const Color(0xFF59586F);
  late Color success = const Color(0xFF18E318);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFE2A2A);
  late Color info = const Color(0xFFFFFFFF);

  late Color white8 = const Color(0x15FFFFFF);
  late Color orange = const Color(0xFFFB973A);
  late Color purpleLight = const Color(0xFFB5ABFF);
  late Color white40 = const Color(0x66FDFDFD);
  late Color divider = const Color(0x1EFFFFFF);
  late Color orangeLight = const Color(0xFFF0BA92);
  late Color overlay = const Color(0xCD000000);
  late Color blueLight = const Color(0xFF99F0D0);
  late Color black40 = const Color(0x65060409);
  late Color greenLight = const Color(0xFFAAEBA0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
