import 'package:flutter/material.dart';

import 'package:pokedex/config/application.dart';
import 'package:pokedex/pages/home/main.dart';

void main() => runApp(MyApp());

/// Main entry point for app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: Application.appTheme(),
      home: Home(),
    );
  }
}
