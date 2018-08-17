import 'package:flutter/material.dart';

import 'package:pokedex/layouts/default.dart';
import 'package:pokedex/db/json-pokemons.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon-asset.dart';

class Home extends StatelessWidget {
  final List<Pokemon> pokemons = JSONPokemons.pokemons();

  @override
  Widget build(BuildContext context) {
    return Default(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemBuilder: _buildGridPokemons,
              itemCount: pokemons.length,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).orientation == Orientation.landscape) ? 5 : 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridPokemons(BuildContext context, int index) {
    Pokemon pokemon = pokemons[index];

    /// widget
    return MaterialButton(
      padding: const EdgeInsets.all(3.0),

      /// actions
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/$index');
      },
      child: Column(
        children: <Widget>[
          /// Image
          Expanded(
            child: PokemonAsset(number: pokemon.number),
          ),

          /// Pokemon name
          Text(
            pokemon.name,
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    );
  }
}
