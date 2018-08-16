import 'package:flutter/material.dart';

import 'package:pokedex/layout/tabbed.dart';
import 'package:pokedex/pages/eggs/pokemons.dart';

class Eggs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tabbed(
      title: 'Eggs Distance',
      length: 4,
      tabs: <String>[
        'All',
        '2 km',
        '5 km',
        '10 km',
      ],
      children: <Widget>[
        Pokemons(distance: 0),
        Pokemons(distance: 2),
        Pokemons(distance: 5),
        Pokemons(distance: 10),
      ],
    );
  }
}
