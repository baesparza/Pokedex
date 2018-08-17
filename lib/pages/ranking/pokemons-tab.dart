import 'package:flutter/material.dart';

import 'package:pokedex/db/json-pokemons.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon-list-item.dart';

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
    pokemons[index];
    return PokemonListItem(
      name: pokemons[index].name,
      number: pokemons[index].number,

      /// Ranking
      child: Container(
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
              TextSpan(text: '${(param == 'HP') ? pokemons[index].maxHP: pokemons[index].maxCP} $param'),
            ],
          ),
        ),
      ),
    );
  }
}
