import 'package:flutter/material.dart';

import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';
import 'package:pokedex/db/pokemons.dart';

class Router {
  static Map<String, WidgetBuilder> appRoutes() {
    return {
      '/': (BuildContext context) => Home(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    List<String> path = settings.name.split('/');

    if (path[0].isNotEmpty) return null;

    if (path[1] == 'pokemon') {
      List<Map<String, dynamic>> pokes = DB.Pokemons;
      return MaterialPageRoute(builder: (BuildContext context) {
        return Pokemon(pokes[int.parse(path[2])]);
      });
    }
    return null;
  }

  static Route appOnUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    });
  }
}
