import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/BottomNavMenu.dart';
import 'package:flutter_app/CurrentUser.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/OptionPages/CartPage.dart';
import 'package:flutter_app/OptionPages/ContactsPage.dart';
import 'package:flutter_app/OptionPages/CurrentOrdersPage.dart';
import 'package:flutter_app/OptionPages/FavoritesPage.dart';
import 'package:flutter_app/OptionPages/HelpPage.dart';
import 'package:flutter_app/OptionPages/HistoryPage.dart';
import 'package:flutter_app/OptionPages/InfoPage.dart';

import '../User.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  double profileTileSize = 200;

  CurrentUser currentUser = CurrentUser();

  Widget createProfileTile() {
    if (currentUser.isEntered) {
      return Container(
        height: profileTileSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 0.6 * profileTileSize,
              height: profileTileSize,
              child: Image.network(currentUser.user!.profileImage, fit: BoxFit.scaleDown),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${currentUser.user!.firstName} \"${currentUser.user!.login}\" ${currentUser.user!.lastName}"),
                Text(currentUser.user!.telNumber)
              ],
            )
          ],
        ),
      );
    }
    else {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: Text('Sign In'),
        color: Colors.blueAccent,
      );
    }
  }

  List<Widget> _listItems = <Widget>[
    Container(),
    Text('Cart'),
    Text('Current orders'),
    Text('Favorites'),
    Text('History'),
    Text('Contacts'),
    Text('Help'),
    Text('Info')
  ];

  final List<Widget> _pages = <Widget>[
    Login(),
    CartPage(),
    CurrentOrders(),
    Favorites(),
    History(),
    Contacts(),
    Help(),
    Info()
  ];

  @override
  Widget build(BuildContext context) {

    _listItems[0] = createProfileTile();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title:_listItems[index],
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]));},
        ),
        itemCount: _listItems.length
    );
  }
}
