import 'package:flutter/material.dart';

import 'package:pokedex/layout/default.dart';

class Pokemon extends StatelessWidget {
  final String id;
  Pokemon(this.id);

  @override
  Widget build(BuildContext context) {
    return Default(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text(id),
      ),
    );
  }
}
