import 'package:flutter/material.dart';

import 'package:pokedex/layout/detail.dart';
import 'package:pokedex/pages/pokemon/info-stats.dart';
import 'package:pokedex/pages/pokemon/info-meta.dart';
import 'package:pokedex/pages/pokemon/info-header.dart';
import 'package:pokedex/widgets/pokemon/poke-types.dart';
import 'package:pokedex/widgets/pokemon/section.dart';

class Pokemon extends StatelessWidget {
  final Map<String, dynamic> res;

  Pokemon(this.res);

  @override
  Widget build(BuildContext context) {
    Color color = Color(int.parse('0xff' + res['colorHex'].substring(1)));
    return Detail(
      primaryColor: color,
      title: res['name'],
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
        children: <Widget>[
          InfoHeader(
            number: res['number'],
            types: res['types'],
          ),

          // Meta data cads
          InfoMeta(
            egg: res['egg'],
            rankingCP: res['rankingCP'],
            rarity: res['rarity'],
          ),

          // Description Section
          Section(
            title: 'Description',
            child: Text(
              res['description'],
              style: Theme.of(context).textTheme.body1,
            ),
          ),

          // Stats Section
          InfoStats(
            color: color,
            attack: res['attack'],
            defense: res['defense'],
            maxCP: res['maxCP'],
            maxHP: res['maxHP'],
            stamina: res['stamina'],
          ),

          // Weaknesses Section
          Section(
            title: 'Weaknesses',
            child: PokeTypes(types: res['weaknesses']),
          ),

          // Strengths Section
          Section(
            title: 'Strengths',
            child: PokeTypes(types: res['strengths']),
          ),
        ],
      ),
    );
  }
}
