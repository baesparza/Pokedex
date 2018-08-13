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
    // calc row using query
    int count =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 5 : 3;
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
    String tempName = widget.pokemons[index]['name'];
    String name = tempName[0].toUpperCase() + tempName.substring(1);
    // draw card
    return GestureDetector(
      onTap: () {
        print('Taped');
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
                child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${n}.png'),
              ),
              Text(
                name,
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
