import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._init();
  static ThemeManager get instance => _instance;

  ThemeManager._init();

  ThemeData get lightTheme => FlexColorScheme.light(
        primary: Colors.orange,
        appBarBackground: Colors.transparent,
        appBarElevation: 0,
      ).toTheme;

  ThemeData get darkTheme => FlexColorScheme.dark(
        primary: Colors.orange,
        appBarBackground: Colors.transparent,
        appBarElevation: 0,
      ).toTheme;
}
