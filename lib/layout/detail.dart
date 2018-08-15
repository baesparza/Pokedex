import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Widget child;
  final Color primaryColor;
  final String title;

  Detail({
    Key key,
    @required this.child,
    @required this.primaryColor,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(title),
      ),
      body: child,
    );
  }
}
