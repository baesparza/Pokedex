import 'package:flutter/material.dart';

class Tabbed extends StatelessWidget {
  final String title;
  final int length;
  final List<Tab> tabs;
  final List<Widget> children;

  Tabbed({
    Key key,
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        // Navbar
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).backgroundColor,

          // Title
          title: Text(title, style: Theme.of(context).textTheme.title),

          // Tabs
          bottom: TabBar(
            // Style
            indicatorWeight: 4.0,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5.0),
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,

            // Tabs
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
