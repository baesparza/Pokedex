import 'package:flutter/material.dart';

class Constants {
  /// App Colors
  static const Color colorRed = Colors.red;
  static const Color colorBlue = Color(0xff4d6478);
  static const Color colorBlack = Color(0xff2A3C4B);
  static const Color colorWhite = Color(0xfffefefe);
  static const Color colorGrey = Color(0xffeaedee);

  /// Types Colors
  static const Color colorNormal = Color(0xff6f6f6f);
  static const Color colorFighting = Color(0xfff6695e);
  static const Color colorFlying = Color(0xff5482ff);
  static const Color colorPoison = Color(0xff4dd9ba);
  static const Color colorGround = Color(0xff94776d);
  static const Color colorRock = Color(0xffb1b1b1);
  static const Color colorBug = Color(0xff33aba0);
  static const Color colorGhost = Color(0xffe8e8e8);
  static const Color colorSteel = Color(0xff8097a2);
  static const Color colorFire = Color(0xffff794f);
  static const Color colorWater = Color(0xff4dabf5);
  static const Color colorGrass = Color(0xff70bf73);
  static const Color colorElectric = Color(0xffffcd39);
  static const Color colorPsychic = Color(0xffb052c0);
  static const Color colorIce = Color(0xff9addfb);
  static const Color colorDragon = Color(0xff7d89cd);
  static const Color colorDark = Color(0xff515b60);
  static const Color colorFairy = Color(0xffed4b82);
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
