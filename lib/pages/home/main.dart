import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/layout/default.dart';
import 'package:pokedex/config/constants.dart';

class Home extends StatefulWidget {
  final List<dynamic> pokemons = [];
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // draw widget
    return Default(
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text('Load Pokemons'),
            onPressed: fetchPokemons,
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: _buildGridPokemons,
              itemCount: widget.pokemons.length,
              primary: false,
              padding: const EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridPokemons(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print('Taped');
      },
      onLongPress: () {
        print('LongPressed');
      },
      child: Card(
        color: Constants.colorRed,
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),
              ),
              Text(
                '${widget.pokemons[index]['name']}'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '#${index+1}',
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

  void fetchPokemons() {
    http.get('http://pokeapi.co/api/v2/pokemon/', headers: {
      'limit': '30',
      'offset': '20'
    }).then((http.Response response) {
      setState(() {
        Map<String, dynamic> res;
        res = json.decode(response.body);
        widget.pokemons.addAll(res['results']);
      });
    });
  }
}
