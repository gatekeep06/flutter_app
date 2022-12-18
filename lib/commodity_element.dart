import 'dart:io';

import 'package:flutter/material.dart';
import 'commodity_page.dart';

class CommodityElement extends StatelessWidget {

  final String imagePath;
  final String commodityName;
  final int cost;

  const CommodityElement(this.imagePath, this.commodityName, this.cost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 150,
            height: 150,
            child: Image.network(imagePath, fit: BoxFit.cover),
          ),
          Text(commodityName),
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
