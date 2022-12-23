import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'commodity_page.dart';

class CommodityElement extends StatelessWidget {

  final String _itemName;
  final String _description;
  final double _price;
  final String _imagePath;

  const CommodityElement(this._itemName, this._description, this._price, this._imagePath, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 75,
                height: 75,
                child: Image.network(_imagePath, fit: BoxFit.cover),
              ),
              Column(
                children: [
                  Text(_itemName),
                  Text(_description)
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child:  Text('$_price \$')
              )
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CommodityPage()));
          },
        )
    );
  }
}

