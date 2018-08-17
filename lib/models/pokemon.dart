import 'package:flutter/material.dart';

class Pokemon {
  final int colorHex;
  final List<String> types;
  final List<String> strengths;
  final List<String> weaknesses;
  final String name;
  final int number;
  final String description;
  final int maxCP;
  final int maxHP;
  final int attack;
  final int defense;
  final int stamina;
  final int egg;
  final String rarity;
  final int spawnRate;
  final int rankingHP;
  final int rankingCP;
  final List<Evolution> evolution;
  final int involution;

  const Pokemon({
    @required this.colorHex,
    @required this.types,
    @required this.strengths,
    @required this.weaknesses,
    @required this.name,
    @required this.number,
    @required this.description,
    @required this.maxCP,
    @required this.maxHP,
    @required this.attack,
    @required this.defense,
    @required this.stamina,
    @required this.egg,
    @required this.rarity,
    @required this.spawnRate,
    @required this.rankingHP,
    @required this.rankingCP,
    @required this.evolution,
    @required this.involution,
  });
}

class Evolution {
  final int number;
  final int candies;

  Evolution({
    @required this.number,
    @required this.candies,
  });
}

class Pokemons {
  final List<Pokemon> pokemons;

  Pokemons({
    @required this.pokemons,
  });
}
