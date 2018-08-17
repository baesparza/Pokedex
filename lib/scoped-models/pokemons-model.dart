import 'package:scoped_model/scoped_model.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/db/json-pokemons.dart';

class PokemonsModel extends ScopedModel {
  final List<Pokemon> _pokemons = JSONPokemons.pokemons();
  List<Pokemon> get pokemons => _pokemons;
}
