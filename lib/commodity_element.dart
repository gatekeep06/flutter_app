import 'dart:io';

import 'package:flutter/material.dart';
import 'commodity_page.dart';

class CommodityElement extends StatelessWidget {
  String image_path = "lib/Example_Images/image_standart.png";
  String commodity_name = "Danik";
  int cost = 666;

  CommodityElement(this.image_path, this.commodity_name, this.cost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 75,
            height: 75,
            child: Image.asset(image_path, fit: BoxFit.scaleDown),
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
