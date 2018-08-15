import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class Application {
  /// Develop/Debug
  static bool enablePerformanceOverlay = false;
  static bool checkerboardRasterCacheImages = false;
  static bool debugShowCheckedModeBanner = false;

  // App theme
  static ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Constants.colorBlue,
      fontFamily: 'Roboto',
    );
  }
}
