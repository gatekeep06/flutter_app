import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../commodity_element.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  static const platform = MethodChannel('samples.flutter_app.dev/item');

  String _itemName = "error";
  String _description = "error";
  double _price = 0;
  String _imagePath = "error";
  int _catalogSize = 1;

  Future<void> _getItemName() async {
    String result;
    try {
      result = await platform.invokeMethod('getItemName');
    } on PlatformException catch (e) {
      result = "Failed to get item name: '${e.message}'.";
    }

    setState(() {
      _itemName = result;
    });
  }

  Future<void> _getDescription() async {
    String result;
    try {
      result = await platform.invokeMethod('getDescription');
    } on PlatformException catch (e) {
      result = "Failed to get item description: '${e.message}'.";
    }

    setState(() {
      _description = result;
    });
  }

  Future<void> _getItemPrice() async {
    double result;
    try {
      result = await platform.invokeMethod('getItemPrice');
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
      result = await platform.invokeMethod('getImagePath');
    } on PlatformException catch (e) {
      result = "Failed to get item image path: '${e.message}'.";
    }

    setState(() {
      _imagePath = result;
    });
  }
  
  Future<void> _getCatalogSize() async {
    int result;
    try {
      result = await platform.invokeMethod('getCatalogSize');
    } on PlatformException catch (e) {
      result = 1;
    }

    setState(() {
      _catalogSize = result;
    });
  }

  @override
  Widget build(BuildContext context) {

    _getCatalogSize();

    return ListView.builder(
      itemCount: _catalogSize,
      itemBuilder: (context, index) {
        _getItemName();
        _getDescription();
        _getItemPrice();
        _getImagePath();
        return CommodityElement(_itemName, _description, _price, _imagePath);
      },
    );
  }
}
