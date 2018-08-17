import 'package:flutter/material.dart';
import 'package:pokedex/widgets/default/sidebar.dart';

class Default extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Default({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // style scafold
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // sidebar
      drawer: Sidebar(),

      // Navbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        titleSpacing: 0.0,

        // Pokeball Icon - sidebar
        leading: MaterialButton(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/img/logo.png'),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),

        // title
        title: Text(
          'Pokedex',
          style: Theme.of(context).textTheme.title,
        ),

        // Action buttons
        actions: <Widget>[
          _buildImageButton(
              path: 'assets/img/ranking.png',
              onPressed: () {
                Navigator.pushNamed(context, '/ranking');
              }),
          _buildImageButton(
              path: 'assets/img/egg.png',
              onPressed: () {
                Navigator.pushNamed(context, '/eggs');
              }),
          _buildImageButton(path: 'assets/img/search.png', onPressed: () {}),
        ],
      ),
      body: child,
    );
  }

  /// Build A material icon with an image
  Widget _buildImageButton({
    @required String path,
    @required Function onPressed,
  }) {
    return MaterialButton(
      minWidth: 0.0,
      child: Image.asset(path),
      onPressed: onPressed,
    );
  }
}
