import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  final ColorScheme light = const ColorScheme(
    primary: Color(0xFFd98fcc),
    secondary: Color(0xFFe82f25),
    tertiary: Color(0xFFf1d2eb),
    brightness: Brightness.light,
    onPrimary: Color(0xFF251522),
    onSecondary: Color(0xFF251522),
    error:  Color(0xFFe82f25),
    onError: Color(0xFF251522),
    surface: Color(0xFFd98fcc),
    onSurface: Color(0xFFf1d2eb),
  );

  ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.exo2TextTheme(),
    primaryColor: const Color(0xFFd98fcc),
    cardColor: const Color(0xFFd98fcc),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFd98fcc),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFf1d2eb),
      onPrimaryContainer: Color(0xFF141111),
      secondary: Color(0xFFe82f25),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFe79bbc),
      onSecondaryContainer: Color(0xFF130D10),
      tertiary: Color(0xFFf1d2eb),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFF7A2C3),
      onTertiaryContainer: Color(0xFF140E10),
      error: Color(0xFFe82f25),
      onError: Color(0xffffffff),
      errorContainer: Color(0xFFf1d2eb),
      onErrorContainer: Color(0xFFe82f25),
      surface: Color(0xfffefdfd),
      onSurface: Color(0xff040404),
      surfaceContainerHighest: Color(0xffedeaea),
      onSurfaceVariant: Color(0xff090909),
      outline: Color(0xFFf1d2eb),
      outlineVariant: Color(0xffc8c8c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff121111),
      onInverseSurface: Color(0xfffafafa),
      inversePrimary: Color(0xFFf1d2eb),
      surfaceTint: Color(0xFFe82f25),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all(30.0),
        iconColor: WidgetStateProperty.all(const Color(0xFFe82f25)),
      ),
    ),
  );
}
