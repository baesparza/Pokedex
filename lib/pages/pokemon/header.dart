import 'package:flutter/material.dart';
import 'package:pokedex/widgets/poke-types.dart';

class Header extends StatelessWidget {
  const Header({
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
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png'),
        ),
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
            PokeTypes(
              types: types,
            )
          ],
        )
      ],
    );
  }
}
