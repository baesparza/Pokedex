import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';
import 'package:pokedex/widgets/ui/sidebar.dart';

class Default extends StatelessWidget {
  final Widget child;

  Default({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'POKEDEX',
            style: TextStyle(
              color: Constants.colorBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            _buildIconButton(Icons.search, () {}),
          ],
        ),
        drawer: new Sidebar(),
        body: child,
      ),
    );
  }

  IconButton _buildIconButton(IconData icon, Function fn) {
    return IconButton(
      onPressed: fn,
      icon: Icon(
        icon,
        color: Constants.colorBlack,
      ),
    );
  }
}


