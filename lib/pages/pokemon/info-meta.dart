import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class InfoMeta extends StatelessWidget {
  const InfoMeta({
    Key key,
    @required this.rankingCP,
    @required this.egg,
    @required this.rarity,
  }) : super(key: key);

  final int egg, rankingCP;
  final String rarity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildCard(
          text: '#$rankingCP',
          path: 'assets/img/ranking.png',
        ),
        _buildCard(
          text: rarity,
          path: 'assets/img/pokeball.png',
        ),
        _buildCard(
          text: (egg == null) ? '-' : '$egg km',
          path: 'assets/img/${(egg == null) ? 'no_egg' : 'egg'}.png',
        ),
      ],
    );
  }

  Expanded _buildCard({@required String text, @required String path}) {
    return Expanded(
      child: Card(
        color: Constants.colorLightGrey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              Image.asset(path),
              Text(
                (text == null) ? '-' : text,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
