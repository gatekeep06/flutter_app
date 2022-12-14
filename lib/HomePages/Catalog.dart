import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Commodity_ListItem.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Commodity_ListItem("lib/Example_Images/image_standart.png", "Danik $index", 666);
        },

    );
  }

}