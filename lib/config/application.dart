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
      backgroundColor: Constants.colorWhite,
      scaffoldBackgroundColor: Constants.colorWhite,
      textTheme: TextTheme(
        title: TextStyle(
          color: Constants.colorBlue,
          fontWeight: FontWeight.w500,
          fontSize: 23.0,
        ),
        subhead: TextStyle(
          color: Constants.colorBlue,
          fontSize: 16.0,
        ),
        body2: TextStyle(
          color: Constants.colorBlue.withAlpha(Constants.alpha),
          fontSize: 17.0,
        ),
        caption: TextStyle(color: Colors.green),
        display1: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
        body1: TextStyle(color: Colors.green),
        headline: TextStyle(
          fontSize: 15.0,
          color: Constants.colorBlue.withAlpha(Constants.alpha),
        ),
      ),
    );
  }
}
