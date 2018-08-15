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
      children: <Widget>[
        _buildStats(text: 'Max CP', value: maxCP, full: 4300),
        _buildStats(text: 'Max HP', value: maxHP, full: 420),
        _buildStats(text: 'Attack', value: attack, full: 300),
        _buildStats(text: 'Defense', value: defense, full: 250),
        _buildStats(text: 'Stamina', value: stamina, full: 520),
      ],
    );
  }

  Widget _buildStats({
    @required String text,
    @required int full,
    @required int value,
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
          Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            width: 80.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                  child: LinearProgressIndicator(
                    value: per,
                    valueColor: valueColor,
                    backgroundColor: Constants.colorGrey,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Constants.colorBlack,
                    ),
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
