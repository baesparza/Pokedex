import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  const Number(
    this.number, {
    Key key,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    String n = number.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '#' + '0' * (3 - n.length) + n,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
