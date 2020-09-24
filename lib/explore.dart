import 'package:app_art_museums/home.dart';
import 'package:flutter/material.dart';
import 'package:app_art_museums/feed.dart';

class Explore extends StatefulWidget {
  Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
          'Explore',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
