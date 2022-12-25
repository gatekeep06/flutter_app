import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/favorites.dart';
import 'commodity_page.dart';

class CommodityElement extends StatefulWidget {

  final int itemId;

  const CommodityElement({Key? key, required this.itemId}) : super(key: key);

  @override
  State<CommodityElement> createState() => _CommodityElementState(itemId);
}

class _CommodityElementState extends State<CommodityElement> {

  static const platform = MethodChannel('samples.flutter_app.dev/item');

  int itemId;
  String _itemName = "error";
  double _price = 0;
  String _imagePath = "error";

  _CommodityElementState(this.itemId);

  Future<void> _getItemName() async {
    String result;
    try {
      result = await platform.invokeMethod('getItemName', {'itemId': itemId});
    } on PlatformException catch (e) {
      result = "Failed to get item name: '${e.message}'.";
    }

    setState(() {
      _itemName = result;
    });
  }

  Future<void> _getItemPrice() async {
    double result;
    try {
      result = await platform.invokeMethod('getItemPrice', {"itemId": itemId});
    } on PlatformException catch (e) {
      result = 0;
    }

    setState(() {
      _price = result;
    });
  }

  Future<void> _getImagePath() async {
    String result;
    try {
      result = await platform.invokeMethod('getImagePath', {"itemId": itemId});
    } on PlatformException catch (e) {
      result = "Failed to get item image path: '${e.message}'.";
    }

    setState(() {
      _imagePath = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _getItemName();
    _getItemPrice();
    _getImagePath();
  }

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
                    padding: EdgeInsets.symmetric(vertical: 3),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    width: 125,
                    height: 125,
                    child: Image.network(_imagePath, fit: BoxFit.cover),
                  ),
                  Text(_itemName),
                  Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                            children: [
                              IconButton(
                                  onPressed: () { setState(() {}); favorites.isInFavorites(itemId) ? favorites.removeFromFavorites(itemId) : favorites.addToFavorites(itemId); },
                                  icon: favorites.isInFavorites(itemId) ? Icon(Icons.star) : Icon(Icons.star_border)
                              ),
                              Text('$_price \$')
                            ]
                        )
                      )
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommodityPage(itemId: itemId)));
              },
          )
        )
    );
  }
}