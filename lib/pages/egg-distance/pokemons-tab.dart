import 'package:flutter/material.dart';

import 'package:pokedex/db/json-eggs.dart';
import 'package:pokedex/models/egg.dart';
import 'package:pokedex/widgets/pokemon-list-item.dart';

class PokemonsTab extends StatelessWidget {
  PokemonsTab({
    Key key,
    @required int distance,
  }) : super(key: key) {
    eggs = JSONEggs.eggs();
    if (distance == 0) {
      return;
    }
    // use var distance as a filter
    eggs.retainWhere((Egg egg) {
      return egg.eggDistance == distance;
    });
  }

  List<Egg> eggs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: _buidlPokemon,
        itemCount: eggs.length,
        primary: false,
      ),
    );
  }

  Widget _buidlPokemon(BuildContext context, int index) {
    return PokemonListItem(
      number: eggs[index].number,
      name: eggs[index].name,

      // ranking
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/img/egg.png'),
            ),
            Text(
              '${ eggs[index].eggDistance} km',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
