import 'package:flutter/material.dart';

import '../sign_in.dart';
import '../OptionPages/cart_page.dart';
import '../OptionPages/contacts_page.dart';
import '../OptionPages/current_orders_page.dart';
import '../OptionPages/favorites_page.dart';
import '../OptionPages/help_page.dart';
import '../OptionPages/history_page.dart';
import '../OptionPages/info_page.dart';
import '../current_user.dart';

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
              child: Image.network(currentUser.user!.profileImage, fit: BoxFit.cover),
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
    SignIn(),
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
