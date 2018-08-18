import 'package:flutter/material.dart';
import 'package:pokedex/widgets/sidebar.dart';

class Detail extends StatelessWidget {
  final Widget child;
  final Color color;
  final String title;

  Detail({
    Key key,
    @required this.child,
    this.color,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sidebar
      drawer: Sidebar(
        color: color,
      ),

      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: color,
        iconTheme: Theme.of(context).primaryIconTheme,

        // title
        title: Text(
          title,
          style: Theme.of(context).primaryTextTheme.title,
        ),

        // close btn
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: child,
    );
  }
}
