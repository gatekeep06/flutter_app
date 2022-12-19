import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/commodity_element.dart';


class GetItem{
  static const platform = MethodChannel('samples.flutter_app.dev/item');

  String _itemName = "Danik";
  String _description = "This is Danik";
  double _price = 666.0;
  String _imagePath = "lib/Example_Images/image_standart.png";

  Future<void> _getItemName() async {
    try {
      final String result = await platform.invokeMethod('getItemName');
      _itemName = result;
    } on PlatformException catch (e) {
      _itemName = "Failed to get item name: '${e.message}'.";
    }
  }
  Future<void> _getItemDescription() async {
    try {
      final String result = await platform.invokeMethod('getDescription');
      _description = result;
    } on PlatformException catch (e) {
      _description = "Failed to get description: '${e.message}'.";
    }
  }

  Future<void> _getItemPrice() async {
    String message;
    try {
      final double result = await platform.invokeMethod('getItemPrice');
      _price = result;
    } on PlatformException catch (e) {
      message = "Failed to get price: '${e.message}'.";
    }
  }

  Future<void> _getImagePath() async {
    try {
      final String result = await platform.invokeMethod('getImagePath');
      _imagePath = result;
    } on PlatformException catch (e) {
      _imagePath = "Failed to get battery level: '${e.message}'.";
    }
  }
}