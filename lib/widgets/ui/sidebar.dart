import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Column(
        children: <Widget>[
          AppBar(
            title: new Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: new Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
