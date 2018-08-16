import 'package:flutter/material.dart';

import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemon/pokemon.dart';
import 'package:pokedex/pages/eggs/eggs.dart';
import 'package:pokedex/db/pokemons.dart';
import 'package:pokedex/pages/ranking/ranking.dart';

class Router {
  static Map<String, WidgetBuilder> appRoutes() {
    return {
      '/': (BuildContext context) => Home(),
      '/eggs': (BuildContext context) => Eggs(),
      '/ranking': (BuildContext context) => Ranking(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    List<String> path = settings.name.split('/');

    if (path[0].isNotEmpty) return null;

    if (path[1] == 'pokemon') {
      List<Map<String, dynamic>> pokes = Pokemons.pokemons();
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
