import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/favorites.dart';
import 'commodity_page.dart';

class CommodityElement extends StatefulWidget {

  final String itemId;
  final String itemName;
  final String description;
  final double price;
  final String imagePath;

  const CommodityElement({Key? key, required this.itemId, required this.itemName, required this.description, required this.price, required this.imagePath}) : super(key: key);

  @override
  State<CommodityElement> createState() => _CommodityElementState(itemId, itemName, description, price, imagePath);
}

class _CommodityElementState extends State<CommodityElement> {

  String _itemId;
  String _itemName;
  String _description;
  double _price;
  String _imagePath;

  _CommodityElementState(this._itemId, this._itemName, this._description, this._price, this._imagePath);

  @override
  Widget build(BuildContext context) {
    
    Favorites favorites = Favorites();

    return Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(80, 178, 255, 89)),
          child: InkWell(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    width: 125,
                    height: 125,
                    child: Image.network(_imagePath, fit: BoxFit.scaleDown),
                  ),
                  Text(_itemName, style: TextStyle(fontSize: 20)),
                  Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                            children: [
                              IconButton(
                                  onPressed: () { setState(() {}); favorites.isInFavorites(_itemId) ? favorites.removeFromFavorites(_itemId) : favorites.addToFavorites(_itemId); },
                                  icon: favorites.isInFavorites(_itemId) ? Icon(Icons.star) : Icon(Icons.star_border)
                              ),
                              Text('$_price \$')
                            ]
                        )
                      )
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommodityPage(itemId: _itemId, itemName: _itemName, description: _description, price: _price, imagePath: _imagePath)));
              },
          )
        )
    );
  }
}