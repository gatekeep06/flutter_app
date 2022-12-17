import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commodity_element.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return CommodityElement(
              "https://sun9-81.userapi.com/impg/xyoh-ZXakv5o4Idz2Z3mSIM_pH5CUBeS0-Jo7g/bRq-8PTOBU4.jpg?size=736x1159&quality=96&sign=6e029fb7823816f578f14bf0b9fbba2e&type=album",
              "Danik $index",
              666);
        },

    );
  }

}