import 'package:flutter/material.dart';

import 'package:pokedex/layout/default.dart';
import 'package:pokedex/db/pokemons.dart';
import 'package:pokedex/widgets/number.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> pokemons = Pokemons.pokemons();

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
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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
    Map<String, dynamic> pokemon = pokemons[index];
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/$index');
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              /// Image
              Expanded(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F${pokemon['number']}.png?alt=media'),
              ),

              /// Pokemon name
              Text(
                pokemons[index]['name'],
                style: TextStyle(fontWeight: FontWeight.w500,),
              ),

              /// Pokemon number
              Number(pokemon['number']),

              /// end Card
            ],
          ),
        ),
      ),
    );
  }
}
