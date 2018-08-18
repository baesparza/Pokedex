import 'package:flutter/material.dart';
import 'package:pokedex/widgets/sidebar.dart';

class Detail extends StatelessWidget {
  final Widget child;
  final Color primaryColor;
  final String title;

  Detail({
    Key key,
    @required this.child,
    this.primaryColor,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sidebar
      endDrawer: Sidebar(),

      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: primaryColor,

        // title
        title: Text(
          title,
          style: Theme.of(context).primaryTextTheme.title,
        ),

        // icon
        iconTheme: Theme.of(context).primaryIconTheme,
      ),
      body: child,
    );
  }
}
