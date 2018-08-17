import 'package:flutter/material.dart';

import 'package:pokedex/db/json-eggs.dart';
import 'package:pokedex/models/egg.dart';
import 'package:pokedex/widgets/number.dart';

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
    Egg egg = eggs[index];
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          /// Image
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F${egg.number}.png?alt=media'),
          ),

          /// Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Number(egg.number),
                Text(
                  egg.name,
                  style: Theme.of(context).textTheme.display2,
                ),
              ],
            ),
          ),

          /// Egg icon
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/img/egg.png'),
                ),
                Text(
                  '${egg.eggDistance} km',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),

      /// Navigate to specific pokemon
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/${egg.number - 1}');
      },
    );
  }
}
