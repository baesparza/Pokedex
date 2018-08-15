import 'package:flutter/material.dart';

import 'package:pokedex/layout/detail.dart';
import 'package:pokedex/config/constants.dart';

class Pokemon extends StatelessWidget {
  final Map<String, dynamic> res;

  Pokemon(this.res);

  @override
  Widget build(BuildContext context) {
    Color color = Color(int.parse('0xff' + res['colorHex'].substring(1)));
    return Detail(
      primaryColor: color,
      title: res['name'] + ' Details',
      children: <Widget>[
        InfoHeader(
          number: res['number'].toString(),
          name: res['name'],
          types: res['types'],
        ),
        InfoMeta(
          egg: res['egg'],
          rankingCP: res['rankingCP'],
          rarity: res['rarity'],
        ),
        InfoDescription(
          description: res['description'],
        ),
        InfoStats(
          color: color,
          attack: res['attack'],
          defense: res['defense'],
          maxCP: res['maxCP'],
          maxHP: res['maxHP'],
          stamina: res['stamina'],
        ),
        InfoAbilities(
          title: 'Weaknesses',
          types: res['weaknesses'],
        ),
        InfoAbilities(
          title: 'Strengths',
          types: res['strengths'],
        ),
      ],
    );
  }

  static Widget _buildSections({@required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  static Widget _buildSubTitles(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Return list of widgets depending on number of types
  static List<Widget> _buildTypes(List<String> types) {
    List<Widget> widgets = [];
    // get types
    for (String type in types) {
      Widget text = Container(
        decoration: BoxDecoration(
          color: Constants.getTypeColor(type),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        margin: EdgeInsets.only(right: 10.0, top: 2.0),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
            color: Constants.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      widgets.add(text);
    }
    // return widgets
    return widgets;
  }
}

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
        color: Constants.colorGrey,
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
    return Pokemon._buildSections(
      children: <Widget>[
        Pokemon._buildSubTitles('Statistics'),
        _buildStats(
          text: 'Max CP',
          value: maxCP,
          full: 4300,
        ),
        _buildStats(
          text: 'Max HP',
          value: maxHP,
          full: 420,
        ),
        _buildStats(
          text: 'Attack',
          value: attack,
          full: 300,
        ),
        _buildStats(
          text: 'Defense',
          value: defense,
          full: 250,
        ),
        _buildStats(
          text: 'Stamina',
          value: stamina,
          full: 520,
        ),
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
                  height: 16.0,
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

class InfoAbilities extends StatelessWidget {
  const InfoAbilities({
    Key key,
    @required this.title,
    @required this.types,
  }) : super(key: key);

  final List<String> types;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Pokemon._buildSections(
        children: <Widget>[
          Pokemon._buildSubTitles(title),
          Row(
            children: Pokemon._buildTypes(types),
          ),
        ],
      ),
    );
  }
}

class InfoDescription extends StatelessWidget {
  const InfoDescription({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Pokemon._buildSections(
      children: <Widget>[
        Pokemon._buildSubTitles('Description'),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    Key key,
    @required this.number,
    @required this.name,
    @required this.types,
  }) : super(key: key);

  final String number;
  final String name;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    String id = '#' + '0' * (3 - number.length) + number;
    ////
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text((id)),
            Text(
              name,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: Pokemon._buildTypes(types),
            )
          ],
        )
      ],
    );
  }
}
