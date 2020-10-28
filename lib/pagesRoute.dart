import 'package:app_art_museums/pages/feed.dart';
import 'package:app_art_museums/main.dart';
import 'package:app_art_museums/pages/explore.dart';
import 'package:app_art_museums/pages/favorites.dart';
import 'package:flutter/material.dart';

class PagesRoute extends StatefulWidget {
  PagesRoute({Key key}) : super(key: key);
  @override
  _PagesRouteState createState() => _PagesRouteState();
}

class _PagesRouteState extends State<PagesRoute> {
  PageController _pageController = PageController();
  List<Widget> _screens = [Home(), Feed(), Explore(), Favorites()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                ),
                title: Text(
                  'Feed',
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    fontFamily: 'Montserrat',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                ),
                title: Text(
                  'Explore',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    fontFamily: 'Montserrat',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                ),
                title: Text(
                  'Favorites',
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                    fontFamily: 'Montserrat',
                  ),
                )),
          ]),
    );
  }
}
