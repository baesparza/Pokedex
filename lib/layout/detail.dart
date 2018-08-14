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
        elevation: 0.0,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        child: child,
      ),
    );
  }
}
