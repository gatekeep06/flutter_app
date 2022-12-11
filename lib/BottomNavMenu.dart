import 'package:flutter/material.dart';

class BottomNavMenu extends State<StatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _navMenuAppBarItems = <Widget>[
    Text('Catalog'),
    TextField(decoration: InputDecoration(
        icon: Icon(Icons.search),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder()
    ),),
    Text('Profile')
  ];

  static const List<Widget> _navMenuBodyItems = <Widget>[
    Text('Catalog'),
    Text('Search'),
    Text('Profile')
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
            label: 'Person',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}