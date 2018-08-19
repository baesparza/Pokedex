import 'package:flutter/material.dart';

class PokemonAsset extends StatelessWidget {
  final int number;

  const PokemonAsset({
    Key key,
    @required this.number,
  })  : assert(number != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png');
  }
}
