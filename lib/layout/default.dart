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
        appBar: _buildNavbar(),
        drawer: Sidebar(),
        body: child,
      ),
    );
  }

  AppBar _buildNavbar() {
    return AppBar(
      iconTheme: IconThemeData(color: Constants.colorBlack),
      backgroundColor: Constants.colorWhite,
      titleSpacing: 0.0,
      leading: MaterialButton(
        child: Image.asset('assets/img/logo.png'),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      title: Text(
        'Pokedex',
        style: TextStyle(
          color: Constants.colorBlack,
          fontWeight: FontWeight.w500,
          fontSize: 23.0,
        ),
      ),
      actions: <Widget>[
        _buildIconButton('assets/img/ranking.png', () {}),
        _buildIconButton('assets/img/egg.png', () {}),
        _buildIconButton('assets/img/search.png', () {}),
      ],
    );
  }

  Widget _buildIconButton(String path, Function fn) {
    return MaterialButton(
      minWidth: 10.0,
      child: Image.asset(path),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    );
  }
}
