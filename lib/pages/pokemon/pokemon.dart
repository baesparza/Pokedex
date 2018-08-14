import 'package:flutter/material.dart';

import 'package:pokedex/layout/detail.dart';
import 'package:pokedex/config/constants.dart';

class Pokemon extends StatelessWidget {
  final Map<String, dynamic> res;

  Pokemon(this.res);

  @override
  Widget build(BuildContext context) {
    return Detail(
      primaryColor: Color(int.parse('0xff' + res['colorHex'].substring(1))),
      title: res['name'] + ' Details',
      children: <Widget>[
        Text(res.toString()),
        InfoHeader(
          number: res['number'].toString(),
          name: res['name'],
          types: res['types'],
        ),
        InfoDescription(
          description: res['description'],
        ),
        Pokemon._buildSections(
          children: <Widget>[
            Pokemon._buildSubTitles('Statistics'),
          ],
        ),
      ],
    );
  }

  static Widget _buildSections({@required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  static Widget _buildSubTitles(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Return list of widgets depending on number of types
  static List<Widget> _buildTypes(List<String> types) {
    List<Widget> widgets = [];
    // get types
    for (String type in types) {
      Widget text = Container(
        decoration: BoxDecoration(
          color: Constants.getTypeColor(type),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        margin: EdgeInsets.only(right: 10.0, top: 2.0),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
            color: Constants.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      widgets.add(text);
    }
    // return widgets
    return widgets;
  }
}

class InfoDescription extends StatelessWidget {
  const InfoDescription({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Pokemon._buildSections(
      children: <Widget>[
        Pokemon._buildSubTitles('Description'),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    Key key,
    @required this.number,
    @required this.name,
    @required this.types,
  }) : super(key: key);

  final String number;
  final String name;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    String id = '#' + '0' * (3 - number.length) + number;
    ////
    return Row(
      children: <Widget>[
        Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text((id)),
            Text(
              name,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: Pokemon._buildTypes(types),
            )
          ],
        )
      ],
    );
  }
}
