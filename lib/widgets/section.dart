import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  Section({
    Key key,
    @required this.children,
    @required this.title,
  }) : super(key: key) {
    children.insert(
      0,
      Padding(
        padding: const EdgeInsets.only(bottom: 13.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
