import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.accessible_forward),
          Icon(Icons.account_balance_wallet),
        ],
      ),
    );
  }
}
