import 'package:flutter/material.dart';

import 'package:pokedex/layouts/tabbed.dart';
import 'package:pokedex/pages/ranking/pokemons-tab.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tabbed(
      title: 'Pokemon Ranking',
      length: 2,
      tabs: <String>[
        'CP',
        'HP',
      ],
      children: <Widget>[
        PokemonsTab(sortByHP: false),
        PokemonsTab(sortByHP: true),
      ],
    );
  }
}
