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
          AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            iconTheme: Theme.of(context).iconTheme,

            // title
            title: Text(
              'Menu',
              style: Theme.of(context).textTheme.title,
            ),

            // close buttom
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),

          /// list items
          // Ranking
          _buildListItem(
            context,
            title: 'Pokemon Ranking',
            path: 'assets/img/ranking.png',
            onTap: () {
              Navigator.pushNamed(context, '/ranking');
            },
          ),
          // Eggs
          _buildListItem(
            context,
            title: 'Eggs Distance',
            path: 'assets/img/egg.png',
            onTap: () {
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
