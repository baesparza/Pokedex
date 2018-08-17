import 'package:flutter/material.dart';

import 'package:pokedex/db/json-pokemons.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/number.dart';

class PokemonsTab extends StatelessWidget {
  PokemonsTab({
    Key key,
    @required bool sortByHP,
  }) : super(key: key) {
    param = (sortByHP) ? 'HP' : 'CP';

    /// sort Pokemons by param
    pokemons.sort((Pokemon a, Pokemon b) {
      if (sortByHP) return a.maxHP >= b.maxHP ? -1 : 1;
      return a.maxCP >= b.maxCP ? -1 : 1;
    });
  }

  List<Pokemon> pokemons = JSONPokemons.pokemons();
  String param, smallParam;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: _buidlPokemon,
        itemCount: pokemons.length,
        primary: false,
      ),
    );
  }

  Widget _buidlPokemon(BuildContext context, int index) {
    Pokemon pokemon = pokemons[index];
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          /// Image
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F${pokemon.number}.png?alt=media'),
          ),

          /// Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Number(pokemon.number),
                Text(
                  pokemon.name,
                  style: Theme.of(context).textTheme.display2,
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
                style: Theme.of(context).textTheme.caption,
                children: <TextSpan>[
                  TextSpan(text: '#'),
                  TextSpan(
                    text: '${index + 1}\n',
                    style: Theme.of(context).textTheme.display2,
                  ),
                  TextSpan(text: '${(param == 'HP') ? pokemon.maxHP: pokemon.maxCP} $param'),
                ],
              ),
            ),
          ),

          /// end wid
        ],
      ),

      /// Navigate to specific pokemon
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/${pokemon.number - 1}');
      },
    );
  }
}
