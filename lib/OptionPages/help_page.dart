import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Container(
        alignment: Alignment.center,
        child: Image.network('https://media.tenor.com/05uuw_HTPOYAAAAM/rick-astley-never-gonna-give-you-up.gif'),
      )
    );
  }
}
