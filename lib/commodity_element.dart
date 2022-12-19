import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/get_item.dart';
import 'commodity_page.dart';

class CommodityElement extends StatelessWidget {



  String commodity_name;
  String description;
  double price;
  String image_path;

  CommodityElement(this.commodity_name, this.description, this.price, this.image_path, {super.key});


  String _itemName = "Danik";
  String _description = "This is Danik";
  double _price = 666.0;
  String _imagePath = "lib/Example_Images/image_standart.png";




  @override
  Widget build(BuildContext context) {
    var _item=  CommodityElement(_itemName,_description,_price,_imagePath);
    price = _item.price;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 75,
            height: 75,
            child: Image.asset(_item.image_path, fit: BoxFit.scaleDown),
          ),
          Text(_item.commodity_name),

          Text('$price \$'),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CommodityPage()));
      },
      )
    );
  }

}
