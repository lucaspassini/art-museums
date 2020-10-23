import 'package:app_art_museums/home.dart';
import 'package:app_art_museums/api/model/artInfo.dart';
import 'package:app_art_museums/api/artAPI.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Future<Record> _records;

  @override
  void initState() {
    _records = ArtAPI().getArt();
    super.initState();
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
        child: FutureBuilder<Record>(
          future: _records,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.baseimageurl.length,
                  itemBuilder: (context, index) {
                    var imageurl = snapshot.data.baseimageurl[index];
                    return Container(
                      height: 100,
                      color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          Image.network(''),
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
