import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Widget child;
  final Color primaryColor;

  Detail({
    Key key,
    @required this.child,
    @required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Details'),
        centerTitle: true,
      ),
      body: child,
    );
  }
}
