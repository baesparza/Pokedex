import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';
import 'package:pokedex/db/pokemons.dart' as db;

class Pokemons extends StatelessWidget {
  Pokemons({
    Key key,
    @required bool sortByHP,
  }) : super(key: key) {
    param = (sortByHP) ? 'maxHP' : 'maxCP';
    smallParam = (sortByHP) ? 'HP' : 'CP';

    /// sort Pokemons by param
    pokemons.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
      return a[param] >= b[param] ? -1 : 1;
    });
  }

  List<Map<String, dynamic>> pokemons = db.Pokemons.pokemons();
  String param, smallParam;

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
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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

          /// Ranking
          Container(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Constants.colorBlue.withAlpha(Constants.alpha),
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '#'),
                    TextSpan(
                      text: '${index + 1}\n',
                      style: TextStyle(
                        color: Constants.colorBlue,
                      ),
                    ),
                    TextSpan(
                      text: '${pokemon[param]} $smallParam',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              )
              // Column(
              //   children: <Widget>[
              //     Text(
              //       '#${index + 1}',
              //       style: TextStyle(
              //         fontSize: 21.0,
              //       ),
              //     ),
              //     Text(
              //       ,
              //       style: TextStyle(
              //         fontSize: 18.0,
              //         color: Constants.colorGrey,
              //       ),
              //     ),
              //   ],
              // ),
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
