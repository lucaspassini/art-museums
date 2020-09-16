import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.account_box),
          Icon(Icons.access_time),
        ],
      ),
    );
  }
}
