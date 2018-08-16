import 'package:flutter/material.dart';

import 'package:pokedex/db/eggs.dart';

class Pokemons extends StatelessWidget {
  Pokemons({
    Key key,
    @required int distance,
  }) : super(key: key) {
    pokemons = Eggs.eggs();
    if (distance == 0) {
      return;
    }
    // use var distance as a filter
    pokemons.retainWhere((Map<String, dynamic> pokemon) {
      return pokemon['eggDistance'] == distance;
    });
  }

  List<Map<String, dynamic>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: _buidlPokemon,
        itemCount: pokemons.length,
      ),
    );
  }

  Widget _buidlPokemon(BuildContext context, int index) {
    Map<String, dynamic> pokemon = pokemons[index];
    String number = '${pokemon['number']}';
    return MaterialButton(
      child: Row(
        children: <Widget>[
          /// Image
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F${number}.png?alt=media'),
          ),

          /// Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '#' + '0' * (3 - number.length) + number,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  pokemon['name'],
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          /// Egg icon
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/img/egg.png'),
                Text(
                  '${pokemon['eggDistance']} km',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),

          /// end wid
        ],
      ),

      /// Navigate to specific pokemon
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/${pokemon['number'] - 1}');
      },
    );
  }
}
