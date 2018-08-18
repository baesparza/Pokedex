import 'package:flutter/material.dart';
import 'package:pokedex/widgets/sidebar.dart';

class Tabbed extends StatelessWidget {
  final String title;
  final int length;
  final List<String> tabs;
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
        // sidebar
        drawer: Sidebar(
          ranking: !title.contains('Ranking'),
          eggsDistance: !title.contains('Eggs'),
        ),

        // Navbar
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).backgroundColor,

          // Title
          title: Text(title, style: Theme.of(context).textTheme.title),

          // back btn
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          ],

          // Tabs
          bottom: TabBar(
            // Style
            indicatorWeight: 4.0,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5.0),
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,

            // Tabs
            tabs: tabs
                .map((String tab) => Container(
                      height: kTextTabBarHeight,
                      child: Center(
                        child: Text(tab, style: Theme.of(context).textTheme.headline),
                      ),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
