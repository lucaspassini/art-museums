import 'package:flutter/material.dart';

import 'package:app_art_museums/services/artInfo.dart';

class GridDescription extends StatefulWidget {
  final Record curRecord;
  GridDescription({@required this.curRecord});

  @override
  _GridDescriptionState createState() => _GridDescriptionState();
}

class _GridDescriptionState extends State<GridDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: null, image: widget.curRecord.baseimageurl),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
                child: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop())
          ],
        ),
      ),
    );
  }
}
