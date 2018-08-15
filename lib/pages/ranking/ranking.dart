import 'package:flutter/material.dart';

import 'package:pokedex/layout/tabbed.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tabbed(
      title: 'Pokemon Ranking',
      length: 2,
      initialIndex: 0,
      tabs: <Tab>[
        Tab(
          child: Text('CP'),
        ),
        Tab(
          child: Text('HP'),
        ),
      ],
      children: <Widget>[
        Container(),
        Container(),
      ],
    );
  }
}
