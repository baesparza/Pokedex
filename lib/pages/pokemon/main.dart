import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/layout/default.dart';
import 'package:pokedex/config/constants.dart';

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
  // TODO: return wid after response, an manage invalid states
  PokemonState() {
    // fetch data
    http
        .get('http://pokeapi.co/api/v2/pokemon/${widget.id}/')
        .then((http.Response response) {
      setState(() {
        widget.res = json.decode(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(number),
                Text(name),
                Row(
                  children: _buildTypes(res['types']),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  /// Return list of widgets depending on number of types
  List<Widget> _buildTypes(List<dynamic> types) {
    List<Widget> widgets = [];
    // get types
    for (Map<dynamic, dynamic> type in types) {
      String typeName = type['type']['name'];

      Widget text = Container(
        decoration: BoxDecoration(color: Constants.getTypeColor(typeName)),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        margin: EdgeInsets.only(right: 10.0, top: 10.0),
        child: Text(
          typeName.toUpperCase(),
          style: TextStyle(
            color: Constants.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      widgets.insert(0, text);
    }
    // return widgets
    return widgets;
  }
}
