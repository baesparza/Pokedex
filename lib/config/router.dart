import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemon/pokemon-details.dart';
import 'package:pokedex/pages/egg-distance/egg-distance.dart';
import 'package:pokedex/db/json-pokemons.dart';
import 'package:pokedex/pages/ranking/ranking.dart';

class Router {
  static Map<String, WidgetBuilder> appRoutes() {
    return {
      '/': (BuildContext context) => Home(),
      '/eggs': (BuildContext context) => EggDistance(),
      '/ranking': (BuildContext context) => Ranking(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    List<String> path = settings.name.split('/');

    if (path[0].isNotEmpty) return null;

    if (path[1] == 'pokemon') {
      List<Pokemon> pokes = JSONPokemons.pokemons();
      return MaterialPageRoute(builder: (BuildContext context) {
        return PokemonDetails(pokes[int.parse(path[2])]);
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
