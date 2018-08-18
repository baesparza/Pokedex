import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';
import 'package:pokedex/widgets/pokemon/section.dart';

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
          _buildProgressBar(text: 'Max CP', value: maxCP, full: 4300, context: context),
          _buildProgressBar(text: 'Max HP', value: maxHP, full: 420, context: context),
          _buildProgressBar(text: 'Attack', value: attack, full: 300, context: context),
          _buildProgressBar(text: 'Defense', value: defense, full: 250, context: context),
          _buildProgressBar(text: 'Stamina', value: stamina, full: 520, context: context),
        ],
      ),
    );
  }

  // build progress bar
  Widget _buildProgressBar({
    @required String text,
    @required int full,
    @required int value,
    @required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Stat name
          Container(
            child: Text(
              text,
              style: Theme.of(context).textTheme.caption,
            ),
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
                    value: value / full,
                    valueColor: valueColor,
                    backgroundColor: Constants.colorLightGrey,
                  ),
                ),
                Text(
                  '$value/$full',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
