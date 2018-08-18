import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  final Widget child;

  Default({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // style scafold
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // Navbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0.0,

        // Pokeball Icon - sidebar
        leading: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Image.asset('assets/img/logo.png'),
        ),

        // title
        title: Row(
          children: <Widget>[
            Text(
              'Pokedex',
              style: Theme.of(context).textTheme.title,
            ),
          ],
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
