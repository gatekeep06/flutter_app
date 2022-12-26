import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/favorites.dart';

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

  _getFavoritesFromBD() async {
    var list = await (await FirebaseFirestore.instance.collection('users')
        .get()).docs.firstWhere((element) => element.id == CurrentUser().user!.userId).get('favorites');
    setState(() {
      Favorites().list = list;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (CurrentUser().isEntered) {
      _getFavoritesFromBD();
    }

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