import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  Section({
    Key key,
    @required this.child,
    @required this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Title
          Container(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.display1,
            ),
          ),

          /// content
          child,
        ],
      ),
    );
  }
}
