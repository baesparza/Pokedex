import 'package:flutter/material.dart';
import 'package:pokedex/config/constants.dart';

class Number extends StatelessWidget {
  const Number(
    this.number, {
    Key key,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    String n = number.toString();
    return Text(
      '#' + '0' * (3 - n.length) + n,
      style: TextStyle(
        fontSize: 15.0,
        color: Constants.colorBlue.withAlpha(Constants.alpha),
      ),
    );
  }
}
