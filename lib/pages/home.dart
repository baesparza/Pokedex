import 'package:flutter/material.dart';

import 'package:pokedex/layout/default.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/db/pokemons.dart';

class Home extends StatefulWidget {
  final List<Map<String, dynamic>> pokemons = DB.Pokemons;
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // calc row using query
    int count = (MediaQuery.of(context).orientation == Orientation.landscape) ? 5 : 3;
    // draw widget
    return Default(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemBuilder: _buildGridPokemons,
              itemCount: widget.pokemons.length,
              primary: true,
              padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon/$index');
      },
      onLongPress: () {
        print('LongPressed');
      },
      child: Card(
        color: Constants.colorGrey,
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child:
                    Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${n}.png'),
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
