import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  final Widget child;

  Default({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: child,
    );
  }
}
