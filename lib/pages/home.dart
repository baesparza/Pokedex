import 'package:flutter/material.dart';

import 'package:pokedex/layout/default.dart';
import 'package:pokedex/db/pokemons.dart';

class Home extends StatefulWidget {
  final List<Map<String, dynamic>> pokemons = Pokemons.pokemons;
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Default(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemBuilder: _buildGridPokemons,
              itemCount: widget.pokemons.length,
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
    // logic
    String n = '${index+1}';
    String id = '#' + '0' * (3 - n.length) + n;
    // draw card
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
              Expanded(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F$n.png?alt=media'),
              ),
              Text(
                widget.pokemons[index]['name'],
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                id,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
