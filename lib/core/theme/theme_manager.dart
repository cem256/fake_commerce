import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData get lightTheme => FlexColorScheme.light(
        primary: Colors.orangeAccent,
        bottomAppBarElevation: 4,
        appBarElevation: 4,
      ).toTheme;

  ThemeData get darkTheme => FlexColorScheme.dark(
        primary: Colors.orangeAccent,
        bottomAppBarElevation: 4,
        appBarElevation: 4,
      ).toTheme;
}
