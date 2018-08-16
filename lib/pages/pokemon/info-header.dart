import 'package:flutter/material.dart';
import 'package:pokedex/widgets/number.dart';
import 'package:pokedex/widgets/poke-types.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    Key key,
    @required this.number,
    @required this.types,
  }) : super(key: key);

  final int number;
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
            Number(number),
            PokeTypes(
              types: types,
            )
          ],
        )
      ],
    );
  }
}
