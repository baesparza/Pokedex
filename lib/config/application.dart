import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class Application {
  // Develop/Debug config
  static bool enablePerformanceOverlay = false;
  static bool checkerboardRasterCacheImages = false;
  static bool debugShowCheckedModeBanner = false;

  // App theme
  static ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Constants.colorBlue,
      fontFamily: 'Roboto',

      // Backgrounds
      backgroundColor: Constants.colorWhite,
      scaffoldBackgroundColor: Constants.colorWhite,

      // theme for icons on white background
      iconTheme: IconThemeData(
        color: Constants.colorBlue,
      ),

      // theme for icons on colored background
      primaryIconTheme: IconThemeData(
        color: Constants.colorWhite,
      ),

      // Theme on colored background
      primaryTextTheme: TextTheme(
        // Title for colored background
        title: TextStyle(
          color: Constants.colorWhite,
          fontWeight: FontWeight.w500,
          fontSize: 23.0,
        ),
      ),

      // Asume Background is Light
      textTheme: TextTheme(
        // Title with white background
        title: TextStyle(
          //color: Colors.red,
          color: Constants.colorBlue,
          fontWeight: FontWeight.w500,
          fontSize: 23.0,
        ),
        subhead: TextStyle(
          color: Constants.colorBlue,
          fontSize: 16.0,
        ),
        caption: TextStyle(
          color: Colors.green,
        ),
        display1: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
          color: Constants.colorBlue,
        ),
        body1: TextStyle(
          fontSize: 17.0,
          color: Constants.colorBlue,
        ),
        body2: TextStyle(
          color: Constants.colorBlue.withAlpha(Constants.alpha),
          fontSize: 17.0,
        ),
        headline: TextStyle(
          fontSize: 16.0,
          color: Constants.colorBlue.withAlpha(Constants.alpha),
        ),
      ),
    );
  }
}
