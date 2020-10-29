import 'package:app_art_museums/pages/pagesRoute.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => PagesRoute()),
              );
            }),
        title: Text(
          'Favorites',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
