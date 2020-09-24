import 'package:app_art_museums/home.dart';
import 'package:flutter/material.dart';
import 'package:app_art_museums/feed.dart';

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
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => Home()),
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
