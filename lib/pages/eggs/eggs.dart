import 'package:flutter/material.dart';

import 'package:pokedex/layout/tabbed.dart';

class Eggs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tabbed(
      title: 'Eggs Distance',
      length: 4,
      tabs: <Tab>[
        Tab(
          child: Text('All'),
        ),
        Tab(
          child: Text('2 km'),
        ),
        Tab(
          child: Text('5 km'),
        ),
        Tab(
          child: Text('10 km'),
        ),
      ],
      children: <Widget>[
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
