import 'package:app_art_museums/home.dart';
import 'package:flutter/material.dart';
import 'package:app_art_museums/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Art Museums',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
=======
      title: 'Feed',
      home: Nav(),
>>>>>>> ba2cc4a8581ae940ea8f6e5cf3bfa8663d4fb11b
    );
  }
}
