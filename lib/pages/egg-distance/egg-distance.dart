import 'package:flutter/material.dart';

import 'package:pokedex/layouts/tabbed.dart';
import 'package:pokedex/pages/egg-distance/pokemons-tab.dart';

class EggDistance extends StatelessWidget {
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
        PokemonsTab(distance: 0),
        PokemonsTab(distance: 2),
        PokemonsTab(distance: 5),
        PokemonsTab(distance: 10),
      ],
    );
  }
}
