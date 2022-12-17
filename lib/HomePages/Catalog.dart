import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commodity_element.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return CommodityElement("lib/Example_Images/image_standart.png", "Danik $index", 666);
        },

    );
  }

}