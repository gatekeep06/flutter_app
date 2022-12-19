import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commodity_element.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});


  @override
  Widget build(BuildContext context) {

    String _itemName = "Danik";
    String _description = "This is Danik";
    double _price = 666.0;
    String _imagePath = "lib/Example_Images/image_standart.png";

    return ListView.builder(
        itemBuilder: (context, index) {
          return CommodityElement(_itemName,_description,_price,_imagePath);
        },

    );
  }

}