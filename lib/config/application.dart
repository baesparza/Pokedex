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

      // Card Color
      cardColor: Constants.colorLightGrey,

      // theme for icons on bacgroundColor
      iconTheme: IconThemeData(
        color: Constants.colorBlue,
      ),

      // theme for icons on primary color or other colors
      primaryIconTheme: IconThemeData(
        color: Constants.colorWhite,
      ),

      // TextTheme for text on primary color or other colors
      primaryTextTheme: TextTheme(
        // Title
        title: TextStyle(
          color: Constants.colorWhite,
          fontWeight: FontWeight.bold,
          fontSize: 23.0,
        ),

        // Image icon
        caption: TextStyle(
          color: Constants.colorBlue,
          fontWeight: FontWeight.bold,
        ),

        // Pokemon type
        headline: TextStyle(
          fontSize: 16.0,
          color: Constants.colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),

      // theme for text on bacgroundColor
      textTheme: TextTheme(
        // Title
        title: TextStyle(
          color: Constants.colorBlue,
          fontWeight: FontWeight.bold,
        ),

        // Pokemon number
        caption: TextStyle(
          fontSize: 16.0,
          color: Constants.colorBlue.withAlpha(Constants.alpha),
        ),

        // style for paragraphs
        body1: TextStyle(
          fontSize: 17.0,
          color: Constants.colorBlue,
        ),

        // list home pokemons
        subhead: TextStyle(
          color: Constants.colorBlue,
          fontSize: 16.0,
        ),

        // section title
        display1: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
          color: Constants.colorBlue,
        ),

        // Tabbed pokemon title and number
        display2: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
          color: Constants.colorBlue,
        ),

        // Tabs title
        headline: TextStyle(
          fontSize: 16.0,
          color: Constants.colorBlue,
        ),
      ),
    );
  }
}
