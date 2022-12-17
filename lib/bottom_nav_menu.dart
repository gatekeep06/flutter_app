import 'package:flutter/material.dart';

import 'HomePages/Catalog.dart';
import 'HomePages/Profile.dart';
import 'HomePages/Search.dart';
import 'current_user.dart';
import 'user.dart';

class BottomNavMenu extends State<StatefulWidget> {

  User nonExistentPerson = User(
      "https://sun9-86.userapi.com/impg/XVv7ulxMNp1RW665uBvdTrSiiZIYzlX5yK09QQ/8WIDYQpGVV8.jpg?size=1080x1440&quality=95&sign=57af9f7214e6f0ea296125edf0f1c266&type=album",
      "Евгений",
      "Самусенко",
      "+375298740491",
      "eugen1",
      "1234");
  CurrentUser currentUser = CurrentUser();

  int _selectedIndex = 0;

  //BottomNavMenu() {
  //  currentUser = CurrentUser.getCurrentUser(nonExistentPerson)!;
  //}

  static const List<Widget> _navMenuAppBarItems = <Widget>[
    Text('Catalog'),
    TextField(
      cursorColor: Colors.green,
      decoration: InputDecoration(
        icon: Icon(Icons.search),
        hintText: 'Search',
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        fillColor: Colors.white,
        filled: true
      ),
    ),
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