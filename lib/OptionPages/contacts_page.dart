import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: Container(
        alignment: Alignment.center,
        child: Image.network("https://media.tenor.com/FMVWwNmwZw4AAAAd/papich-arthas.gif")
      )
    );
  }
}
