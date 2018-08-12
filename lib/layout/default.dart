import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';
import 'package:pokedex/widgets/ui/sidebar.dart';

class Default extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Default({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
              icon: new Icon(
                Icons.blur_circular,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          title: Text(
            'POKEDEX',
            style: TextStyle(
              color: Constants.colorBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            _buildIconButton(Icons.search, () {}),
            _buildIconButton(Icons.settings, () {}),
          ],
        ),
        drawer: Sidebar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.arrow_upward),
          onPressed: () {},
        ),
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
