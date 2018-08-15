import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class PokeTypes extends StatelessWidget {
  const PokeTypes({
    Key key,
    @required this.types,
  }) : super(key: key);

  final List<String> types;

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildTypes(types),
    );
  }
}
