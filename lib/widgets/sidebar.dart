import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // header
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Menu',
                  style: Theme.of(context).primaryTextTheme.title,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),

          /// list items
          // Ranking
          _buildListItem(
            context,
            title: 'Pokemon Ranking',
            path: 'assets/img/ranking.png',
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/ranking');
            },
          ),
          // Eggs
          _buildListItem(
            context,
            title: 'Eggs Distance',
            path: 'assets/img/egg.png',
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/eggs');
            },
          ),
        ],
      ),
    );
  }

  /// build each menu item
  Widget _buildListItem(
    BuildContext context, {
    @required String title,
    @required String path,
    @required Function onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline,
      ),
      leading: Image.asset(path),
      onTap: onTap,
    );
  }
}
