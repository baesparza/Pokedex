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
          ),

          /// list items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                // home
                _buildListItem(
                  context,
                  title: 'Home',
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),

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

                // about
                _buildListItem(
                  context,
                  title: 'About',
                  icon: Icons.info,
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
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
    String path,
    IconData icon,
    @required Function onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline,
      ),
      leading: (path == null)
          ? Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
            )
          : Image.asset(
              path,
            ),
      onTap: onTap,
    );
  }
}
