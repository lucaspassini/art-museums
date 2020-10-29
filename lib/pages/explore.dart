import 'package:app_art_museums/pages/pagesRoute.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => PagesRoute()),
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
