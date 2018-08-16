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
      textTheme: TextTheme(
        title: TextStyle(color: Colors.green),
        body1: TextStyle(color: Colors.green),
        body2: TextStyle(color: Colors.green),
        button: TextStyle(color: Colors.green),
        caption: TextStyle(color: Colors.green),
        display1: TextStyle(color: Colors.green),
        display2: TextStyle(color: Colors.green),
        display3: TextStyle(color: Colors.green),
        display4: TextStyle(color: Colors.green),
        headline: TextStyle(color: Colors.green),
        subhead: TextStyle(color: Colors.green),
      ),
    );
  }
}
