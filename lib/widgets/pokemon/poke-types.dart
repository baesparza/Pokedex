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
    // no types were provided or empty
    if (types == null)
      return Text(
        'No types',
        style: Theme.of(context).textTheme.body1,
      );

    return Row(
      children: types
          .map((String type) => Container(
                decoration: BoxDecoration(
                  color: Constants.getTypeColor(type),
                ),
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                margin: EdgeInsets.only(right: 5.0),
                child: Text(
                  type.toUpperCase(),
                  style: Theme.of(context).primaryTextTheme.headline,
                ),
              ))
          .toList(),
    );
  }
}
