import 'package:app_art_museums/pages/home.dart';
import 'package:app_art_museums/services/artInfo.dart';
import 'package:app_art_museums/services/artAPI.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Future<HarvardArtMuseums> _getArt;

  @override
  void initState() {
    super.initState();
    _getArt = ArtAPI().getArt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Container(
        child: FutureBuilder<HarvardArtMuseums>(
          future: _getArt,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.records.length,
                  itemBuilder: (context, index) {
                    var records = snapshot.data.records[index];
                    return Container(
                      height: 150,
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                records.baseimageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
