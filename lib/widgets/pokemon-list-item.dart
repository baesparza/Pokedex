import 'package:flutter/material.dart';

import 'package:pokedex/widgets/number.dart';
import 'package:pokedex/widgets/pokemon-asset.dart';

class PokemonListItem extends StatelessWidget {
  final int number;
  final String name;
  final Widget child;

  const PokemonListItem({
    Key key,
    @required this.number,
    @required this.name,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      // list item
      child: Row(
        children: <Widget>[
          /// Image
          PokemonAsset(
            number: number,
          ),

          /// Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Number(number),
                Text(
                  name,
                  style: Theme.of(context).textTheme.display2,
                ),
              ],
            ),
          ),

          /// Ranking widget
          child,
        ],
      ),

      // navigate pokemon page
      onPressed: () {
        Navigator.pushNamed(context, '/pokemon/${ number - 1 }');
      },
    );
  }
}
