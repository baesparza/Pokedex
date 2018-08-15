import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

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
        appBar: _buildNavbar(context),
        body: child,
      ),
    );
  }

  AppBar _buildNavbar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Constants.colorBlack),
      backgroundColor: Constants.colorWhite,
      titleSpacing: 0.0,
      leading: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/img/logo.png'),
        ),
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
        _buildIconButton('assets/img/ranking.png', () {
          Navigator.pushNamed(context, '/ranking');
        }),
        _buildIconButton('assets/img/egg.png', () {
          Navigator.pushNamed(context, '/eggs');
        }),
        _buildIconButton('assets/img/search.png', () {}),
      ],
    );
  }

  Widget _buildIconButton(String path, Function fn) {
    return MaterialButton(
      minWidth: 10.0,
      child: Image.asset(path),
      onPressed: fn,
    );
  }
}
