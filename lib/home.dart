import 'package:app_art_museums/feed.dart';
import 'package:flutter/material.dart';
import 'package:app_art_museums/explore.dart';
import 'package:app_art_museums/favorites.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List<Widget> _screens = [Feed(), Explore(), Favorites()];

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
