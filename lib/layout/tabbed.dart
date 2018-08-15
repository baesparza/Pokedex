import 'package:flutter/material.dart';

import 'package:pokedex/config/constants.dart';

class Tabbed extends StatelessWidget {
  final Color primaryColor;
  final String title;
  final int length;
  final List<Tab> tabs;
  final List<Widget> children;

  Tabbed({
    Key key,
    this.primaryColor,
    @required this.title,
    @required this.length,
    @required this.tabs,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(),
          titleSpacing: 0.0,
          backgroundColor: (primaryColor == null) ? Constants.colorWhite : primaryColor,
          title: Text(
            title,
            style: TextStyle(
              color: (primaryColor == null) ? Constants.colorBlack : Constants.colorWhite,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor:
                (primaryColor == null) ? Constants.colorBlack.withAlpha(150) : Constants.colorWhite.withAlpha(175),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (primaryColor == null) ? Constants.colorBlue : Constants.colorWhite,
                  width: 3.0,
                ),
              ),
            ),
            tabs: tabs,
            labelColor: (primaryColor == null) ? Constants.colorBlue : Constants.colorWhite,
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
