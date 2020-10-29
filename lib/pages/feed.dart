import 'package:app_art_museums/login/login.dart';
import 'package:app_art_museums/login/sign_in.dart';
import 'package:app_art_museums/services/artInfo.dart';
import 'package:app_art_museums/services/artAPI.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Future<HarvardArtMuseums> _harvardArtMuseums;

  @override
  void initState() {
    _harvardArtMuseums = ArtAPI().getArt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {
            signOutGoogle().whenComplete(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            });
          },
        ),
      ),
      body: Container(
        child: FutureBuilder<HarvardArtMuseums>(
          future: _harvardArtMuseums,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.records.length,
                  itemBuilder: (context, index) {
                    var records = snapshot.data.records[index];
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                records.baseimageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
