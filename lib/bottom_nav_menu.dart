import 'package:flutter/material.dart';

import 'HomePages/catalog.dart';
import 'HomePages/profile/profile.dart';
import 'HomePages/search.dart';
import 'current_user.dart';
import 'user.dart';

class BottomNavMenu extends State<StatefulWidget> {

  CurrentUser currentUser = CurrentUser();

  int _selectedIndex = 0;

  static const List<Widget> _navMenuAppBarItems = <Widget>[
    Text('Catalog'),
    Text('Search'),
    Text('Profile')
  ];

  static final List<Widget> _navMenuBodyItems = <Widget>[
    Catalog(),
    Search(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: _navMenuAppBarItems.elementAt(_selectedIndex),
      ),

      body: _navMenuBodyItems.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}