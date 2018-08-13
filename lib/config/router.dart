import 'package:flutter/material.dart';

import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemon/main.dart';

class Router {
  static Map<String, WidgetBuilder> appRoutes() {
    return {
      '/': (BuildContext context) => Home(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    List<String> path = settings.name.split('/');

    if (path[0].isNotEmpty) return null;

    if (path[1] == 'pokemon')
      return MaterialPageRoute(builder: (BuildContext context) {
        return Pokemon(
          id: path[2],
        );
      });
    return null;
  }

  static Route appOnUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    });
  }
}
