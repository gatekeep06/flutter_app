import 'package:flutter/material.dart';
import 'package:flutter_app/HomePages/Catalog.dart';
import 'package:flutter_app/HomePages/Profile.dart';
import 'package:flutter_app/HomePages/Search.dart';

class BottomNavMenu extends State<StatefulWidget> {
  int _selectedIndex = 0;

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

  static List<Widget> _navMenuBodyItems = <Widget>[
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
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}