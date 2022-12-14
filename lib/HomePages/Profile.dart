import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  static const List<Widget> _titleName = <Widget>[
    Text('Cart'),
    Text('Current orders'),
    Text('Favorites'),
    Text('History'),
    Text('Contacts'),
    Text('Help'),
    Text('Info')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Sign In')),
        ],
      ),
    );
  }
}
