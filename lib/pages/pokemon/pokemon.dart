import 'package:flutter/material.dart';

import 'package:pokedex/layout/detail.dart';
import 'package:pokedex/pages/pokemon/info-stats.dart';
import 'package:pokedex/pages/pokemon/meta.dart';
import 'package:pokedex/pages/pokemon/info-header.dart';
import 'package:pokedex/widgets/poke-types.dart';
import 'package:pokedex/widgets/section.dart';

class Pokemon extends StatelessWidget {
  final Map<String, dynamic> res;

  Pokemon(this.res);

  @override
  Widget build(BuildContext context) {
    Color color = Color(int.parse('0xff' + res['colorHex'].substring(1)));
    return Detail(
      primaryColor: color,
      child: Column(
        children: <Widget>[
          InfoHeader(
            number: res['number'].toString(),
            name: res['name'],
            types: res['types'],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              children: <Widget>[
                InfoMeta(
                  egg: res['egg'],
                  rankingCP: res['rankingCP'],
                  rarity: res['rarity'],
                ),

                /// Description Section
                Section(
                  title: 'Description',
                  children: <Widget>[
                    Text(
                      res['description'],
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                InfoStats(
                  color: color,
                  attack: res['attack'],
                  defense: res['defense'],
                  maxCP: res['maxCP'],
                  maxHP: res['maxHP'],
                  stamina: res['stamina'],
                ),

                /// Weaknesses Section
                Section(
                  title: 'Weaknesses',
                  children: <Widget>[
                    PokeTypes(types: res['weaknesses']),
                  ],
                ),

                /// Strengths Section
                Section(
                  title: 'Strengths',
                  children: <Widget>[
                    PokeTypes(types: res['strengths']),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
