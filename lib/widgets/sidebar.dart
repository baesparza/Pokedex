import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key key,
    this.color,
    this.eggsDistance = true,
    this.ranking = true,
  }) : super(key: key);

  final Color color;
  final bool eggsDistance;
  final bool ranking;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // header
          AppBar(
            title: Text(
              'Menu',
              style: Theme.of(context).primaryTextTheme.title,
            ),
            backgroundColor: (color == null) ? Theme.of(context).primaryColor : color,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          /// list items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                // Ranking
                (ranking)
                    ? _buildListItem(
                        context,
                        title: 'Pokemon Ranking',
                        path: 'assets/img/ranking.png',
                        onTap: () {
                          Navigator.pushNamed(context, '/ranking');
                        },
                      )
                    : Container(),

                // Eggs
                (eggsDistance)
                    ? _buildListItem(
                        context,
                        title: 'Eggs Distance',
                        path: 'assets/img/egg.png',
                        onTap: () {
                          Navigator.pushNamed(context, '/eggs');
                        },
                      )
                    : Container(),
              ],
            ),
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
