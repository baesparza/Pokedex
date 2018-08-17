import 'package:flutter/material.dart';

class PokemonAsset extends StatelessWidget {
  final int number;
  final bool shiny;

  const PokemonAsset({
    Key key,
    @required this.number,
    this.shiny = false,
  })  : assert(number != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://firebasestorage.googleapis.com/v0/b/pokemon-dex-go.appspot.com/o/sprites%2F${shiny ? 'shiny%2F' : ''}$number.png?alt=media');
  }
}
