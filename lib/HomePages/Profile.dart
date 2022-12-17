import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
    return
        ListView.separated(
          itemCount: _titleName.length,
            itemBuilder: (context, index) {
              return _titleName[index];
            },
          separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}

