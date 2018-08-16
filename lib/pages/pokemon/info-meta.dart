import 'package:flutter/material.dart';

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
          context: context,
          text: '#$rankingCP',
          path: 'assets/img/ranking.png',
        ),
        _buildCard(
          context: context,
          text: rarity,
          path: 'assets/img/pokeball.png',
        ),
        _buildCard(
          context: context,
          text: (egg == null) ? '-' : '$egg km',
          path: 'assets/img/${(egg == null) ? 'no_egg' : 'egg'}.png',
        ),
      ],
    );
  }

  /// Build Card with pokemon stats
  Widget _buildCard({
    @required BuildContext context,
    @required String text,
    @required String path,
  }) {
    return Expanded(
      child: Card(
        elevation: 2.0,
        color: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              // image
              Image.asset(path),
              // text desc
              Container(
                padding: const EdgeInsets.only(top: 13.0),
                child: Text(
                  (text == null) ? '-' : text,
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
