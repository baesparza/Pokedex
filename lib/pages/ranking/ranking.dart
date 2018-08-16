import 'package:flutter/material.dart';

import 'package:pokedex/layout/tabbed.dart';
import 'package:pokedex/pages/ranking/pokemons.dart';

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
        Pokemons(
          sortByHP: false,
        ),
        Pokemons(
          sortByHP: true,
        ),
      ],
    );
  }
}
