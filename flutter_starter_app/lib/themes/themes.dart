// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class Themes {
  static ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.deepPurple,
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.deepPurple,
  );
}
