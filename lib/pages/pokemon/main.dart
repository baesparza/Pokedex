import 'package:flutter/material.dart';

import 'package:pokedex/layout/detail.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/db/pokemon.dart';

class Pokemon extends StatefulWidget {
  final Map<dynamic, dynamic> res = DB.pokemon;

  @override
  PokemonState createState() {
    return PokemonState();
  }
}

class PokemonState extends State<Pokemon> {
  // TODO: return wid after response, an manage invalid states

  @override
  Widget build(BuildContext context) {
    // render widject if data already loaded, otherwise render loading text
    return Detail(
      primaryColor: Constants.getTypeColor('fire'),
      child: (widget.res == null)
          ? Center(
              child: Text('Loading...'),
            )
          : Info(
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
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        InfoHeader(res: res, number: number, name: name),
        Text(),
      ],
    );
  }

  /// Return list of widgets depending on number of types
  static List<Widget> _buildTypes(List<dynamic> types) {
    List<Widget> widgets = [];
    // get types
    for (Map<dynamic, dynamic> type in types) {
      String typeName = type['type']['name'];

      Widget text = Container(
        decoration: BoxDecoration(
          color: Constants.getTypeColor(typeName),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        margin: EdgeInsets.only(right: 10.0, top: 2.0),
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

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    Key key,
    @required this.res,
    @required this.number,
    @required this.name,
  }) : super(key: key);

  final Map res;
  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network(res['sprites']['front_default']),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(number),
            Text(
              name,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: Info._buildTypes(res['types']),
            )
          ],
        )
      ],
    );
  }
}
