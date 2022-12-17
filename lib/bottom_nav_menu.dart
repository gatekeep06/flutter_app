import 'package:flutter/material.dart';

import 'HomePages/Catalog.dart';
import 'HomePages/Profile.dart';
import 'HomePages/Search.dart';
import 'current_user.dart';
import 'user.dart';

class BottomNavMenu extends State<StatefulWidget> {

  User nonExistentPerson = User("https://proza.ru/photos/ibis2.jpg", "Евгений", "Самусенко", "+375298740491", "eugen1", "1234");
  CurrentUser currentUser = CurrentUser();

  int _selectedIndex = 0;

  //BottomNavMenu() {
  //  currentUser = CurrentUser.getCurrentUser(nonExistentPerson)!;
  //}

  static const List<Widget> _navMenuAppBarItems = <Widget>[
    Text('Catalog'),
    TextField(decoration: InputDecoration(
        icon: Icon(Icons.search),
        hintText: 'Search',
        border: UnderlineInputBorder(),
        fillColor: Colors.white,
        filled: true
    ),),
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

    currentUser.setUser(nonExistentPerson);

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