import 'package:flutter/material.dart';
import 'package:flutter_app/HomePages/profile/profile_settings_page.dart';
import 'package:flutter_app/HomePages/profile/sign_in.dart';
import 'package:flutter_app/OptionPages/favorites_page.dart';
import '../../OptionPages/cart_page.dart';
import '../../OptionPages/contacts_page.dart';
import '../../OptionPages/current_orders_page.dart';
import '../../OptionPages/help_page.dart';
import '../../OptionPages/history_page.dart';
import '../../OptionPages/info_page.dart';
import '../../current_user.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  double profileTileSize = 200;

  CurrentUser currentUser = CurrentUser();

  Widget _createPage(valid) {
    if (valid) {
      return ProfileSettingsPage();
    }
    else {
      return SignIn();
    }
  }

  Widget _createProfileTile(valid) {
    if (valid) {
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
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(40),
        alignment: Alignment.center,
        child: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 30)),
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(20))),
      );
    }
  }

  List<Widget> _listItems = <Widget>[
    Container(),
    Text('Cart', style: TextStyle(fontSize: 20)),
    Text('Current orders', style: TextStyle(fontSize: 20)),
    Text('Favorites', style: TextStyle(fontSize: 20)),
    Text('History', style: TextStyle(fontSize: 20)),
    Text('Contacts', style: TextStyle(fontSize: 20)),
    Text('Help', style: TextStyle(fontSize: 20)),
    Text('Info', style: TextStyle(fontSize: 20))
  ];

  List<Widget> _pages = <Widget>[
    Container(),
    CartPage(),
    CurrentOrders(),
    FavoritesPage(),
    History(),
    Contacts(),
    Help(),
    Info()
  ];

  void profileStateCreater(valid) {
    setState(() {
      _listItems[0] = _createProfileTile(valid);
      _pages[0] = _createPage(valid);
    });
  }

  @override
  Widget build(BuildContext context) {

    profileStateCreater(currentUser.isEntered);

    return ListView.builder(
        itemCount: _listItems.length,
        itemBuilder: (context, index) => ListTile(
          title: Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: _listItems[index]
          ),
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index])); },
        )
    );
  }
}
