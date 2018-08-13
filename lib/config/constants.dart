import 'package:flutter/material.dart';

class Constants {
  /// App Colors
  static const Color colorRed = Colors.red;
  static const Color colorBlue = Color(0xff4c6276);
  static const Color colorBlack = Color(0xff2a3c4a);
  static const Color colorWhite = Color(0xfffefefe);
  static const Color colorGrey = Color(0xffeaedee);

  /// Types Colors
  static const Color colorNormal = Color(0xffa9a878);
  static const Color colorFighting = Color(0xffc02f27);
  static const Color colorFlying = Color(0xffae94fd);
  static const Color colorPoison = Color(0xffa03fa1);
  static const Color colorGround = Color(0xffe2c168);
  static const Color colorRock = Color(0xffb89f38);
  static const Color colorBug = Color(0xffa8b820);
  static const Color colorGhost = Color(0xff715799);
  static const Color colorSteel = Color(0xffb8b8d0);
  static const Color colorFire = Color(0xfff17f2e);
  static const Color colorWater = Color(0xff6890f0);
  static const Color colorGrass = Color(0xff78c850);
  static const Color colorElectric = Color(0xfff8ce2a);
  static const Color colorPsychic = Color(0xfff95788);
  static const Color colorIce = Color(0xff98d9d9);
  static const Color colorDragon = Color(0xff6f37f9);
  static const Color colorDark = Color(0xff6f5747);
  static const Color colorFairy = Color(0xffe87890);
  static const Color colorUnknown = Color(0xff);
  // static const Color colorShadow = Color(0xff);

  /// Get type color based on type argument
  static Color getTypeColor(String type) {
    if (type == 'normal') return Constants.colorNormal;
    if (type == 'fighting') return Constants.colorFighting;
    if (type == 'flying') return Constants.colorFlying;
    if (type == 'poison') return Constants.colorPoison;
    if (type == 'ground') return Constants.colorGround;
    if (type == 'rock') return Constants.colorRock;
    if (type == 'bug') return Constants.colorBug;
    if (type == 'ghost') return Constants.colorGhost;
    if (type == 'steel') return Constants.colorSteel;
    if (type == 'fire') return Constants.colorFire;
    if (type == 'water') return Constants.colorWater;
    if (type == 'grass') return Constants.colorGrass;
    if (type == 'electric') return Constants.colorElectric;
    if (type == 'psychic') return Constants.colorPsychic;
    if (type == 'ice') return Constants.colorIce;
    if (type == 'dragon') return Constants.colorDragon;
    if (type == 'dark') return Constants.colorDark;
    if (type == 'fairy') return Constants.colorFairy;
    return Constants.colorUnknown;
  }
}
