import 'package:flutter/material.dart';

import 'package:pokedex/config/application.dart';
import 'package:pokedex/config/router.dart';

void main() => runApp(MyApp());

/// Main entry point for app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: Application.appTheme(),
      routes: Router.appRoutes(),
      onGenerateRoute: Router.onGenerateRoute,
      onUnknownRoute: Router.appOnUnknownRoute,
    );
  }
}
