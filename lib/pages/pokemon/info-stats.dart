import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';
import 'package:pokedex/widgets/section.dart';

class InfoStats extends StatelessWidget {
  final Animation<Color> valueColor;
  final int maxCP;
  final int maxHP;
  final int attack;
  final int defense;
  final int stamina;

  InfoStats({
    @required Color color,
    @required this.maxCP,
    @required this.maxHP,
    @required this.attack,
    @required this.defense,
    @required this.stamina,
  }) : valueColor = AlwaysStoppedAnimation<Color>(color);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Statistics',
      child: Column(
        children: <Widget>[
          _buildStats(text: 'Max CP', value: maxCP, full: 4300, context: context),
          _buildStats(text: 'Max HP', value: maxHP, full: 420, context: context),
          _buildStats(text: 'Attack', value: attack, full: 300, context: context),
          _buildStats(text: 'Defense', value: defense, full: 250, context: context),
          _buildStats(text: 'Stamina', value: stamina, full: 520, context: context),
        ],
      ),
    );
  }

  Widget _buildStats({
    @required String text,
    @required int full,
    @required int value,
    @required BuildContext context,
  }) {
    // calc percentage
    double per = value / full;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Stat name
          Container(
            child: Text(text),
            width: 80.0,
          ),

          /// Progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                  child: LinearProgressIndicator(
                    value: per,
                    valueColor: valueColor,
                    backgroundColor: Constants.colorLightGrey,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline,
                    children: <TextSpan>[
                      TextSpan(text: value.toString()),
                      TextSpan(text: '/'),
                      TextSpan(text: full.toString()),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
