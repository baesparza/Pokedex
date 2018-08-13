import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/layout/default.dart';

class Pokemon extends StatefulWidget {
  final String id;
  Map<dynamic, dynamic> res;

  Pokemon(this.id);

  @override
  PokemonState createState() {
    return new PokemonState();
  }
}

class PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    // TODO: return wid after response, an manage invalid states
    // fetch data
    http
        .get('http://pokeapi.co/api/v2/pokemon/${widget.id}/')
        .then((http.Response response) {
      setState(() {
        widget.res = json.decode(response.body);
      });
    });

    // render widject if data already loaded, otherwise render loading text
    return Default(
      child: (widget.res == null)
          ? Center(
              child: Text('Loading...'),
            )
          : new Info(
              res: widget.res,
            ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key key,
    @required this.res,
  }) : super(key: key);

  final Map<dynamic, dynamic> res;

  @override
  Widget build(BuildContext context) {
    // logic
    String id = res['id'].toString();
    String number = '#' + '0' * (3 - id.length) + id;
    String tempName = res['name'];
    String name = tempName[0].toUpperCase() + tempName.substring(1);
    // render
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(res['sprites']['front_default']),
            Column(
              children: <Widget>[
                Text(number),
                Text(name),
                Row(
                  children: <Widget>[
                    Text(res['types'][0]['type']['name']),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
