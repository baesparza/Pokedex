import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class PokeTypes extends StatelessWidget {
  const PokeTypes({
    Key key,
    @required this.types,
  }) : super(key: key);

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types
          .map((String type) => Container(
                decoration: BoxDecoration(
                  color: Constants.getTypeColor(type),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  type.toUpperCase(),
                  style: Theme.of(context).primaryTextTheme.headline,
                ),
              ))
          .toList(),
    );
  }
}