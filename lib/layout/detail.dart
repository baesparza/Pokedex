import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Widget child;

  final Color primaryColor, secondaryColor;

  Detail({
    Key key,
    @required this.child,
    @required this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text('Pokemon Details'),
      ),
      body: child,
    );
  }
}
