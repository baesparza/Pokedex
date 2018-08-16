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
      length: length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: (primaryColor == null) ? primaryColor : Constants.colorWhite,
          ),
          titleSpacing: 0.0,
          backgroundColor: (primaryColor == null) ? Constants.colorWhite : primaryColor,
          title: Text(
            title,
            style: TextStyle(
              color: (primaryColor == null) ? Constants.colorBlack : Constants.colorWhite,
            ),
          ),
          bottom: TabBar(
            indicatorWeight: 4.0,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5.0),
            unselectedLabelColor:
                (primaryColor == null) ? Constants.colorBlack.withAlpha(150) : Constants.colorWhite.withAlpha(175),
            tabs: tabs,
            labelColor: (primaryColor == null) ? Constants.colorBlue : Constants.colorWhite,
            indicatorColor: (primaryColor == null) ? Constants.colorBlue : Constants.colorWhite,
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
