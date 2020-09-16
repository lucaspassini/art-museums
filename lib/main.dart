import 'package:flutter/material.dart';
import 'package:app_art_museums/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed',
      home: Nav(),
    );
  }
}
