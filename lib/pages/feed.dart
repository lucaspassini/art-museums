import 'package:app_art_museums/services/artInfo.dart';
import 'package:app_art_museums/services/artAPI.dart';
import 'package:app_art_museums/gridcell.dart';
import 'package:flutter/material.dart';
import 'package:app_art_museums/description.dart';
import 'dart:async';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  gridview(AsyncSnapshot<List<Record>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (records) {
            return GestureDetector(
              child: GridTile(child: GridCell(records)),
              onTap: () {
                goToDescriptionPage(context, records);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToDescriptionPage(BuildContext context, Record records) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDescription(
          curRecord: records,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Feed',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Record>>(
                future: ArtAPI.getArt(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return gridview(snapshot);
                  }
                  return circularProgress();
                },
              ),
            ),
          ],
        ));
  }
}
