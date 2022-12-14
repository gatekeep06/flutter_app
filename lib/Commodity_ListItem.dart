import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/CommodityPage.dart';

class Commodity_ListItem extends StatelessWidget {
  String image_path = "lib/Example_Images/image_standart.png";
  String commodity_name = "Danik";
  int cost = 666;

  Commodity_ListItem(String image_path, String commodity_name, int cost, {super.key}) {
    this.image_path = image_path;
    this.commodity_name = commodity_name;
    this.cost = cost;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(image_path, fit: BoxFit.scaleDown),
            width: 75,
            height: 75,
          ),
          Text(commodity_name),
          Text('$cost \$'),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CommodityPage()));
      },
      )
    );
  }


}
