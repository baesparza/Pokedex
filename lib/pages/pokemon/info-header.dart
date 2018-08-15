import 'package:flutter/material.dart';
import 'package:pokedex/widgets/poke-types.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    Key key,
    @required this.number,
    @required this.types,
  }) : super(key: key);

  final String number;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F$number.png?alt=media'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '#' + '0' * (3 - number.length) + number,
              style: TextStyle(fontSize: 16.0),
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
