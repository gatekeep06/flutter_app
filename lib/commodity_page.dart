import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/cart.dart';

class CommodityPage extends StatefulWidget {

  final int itemId;

  const CommodityPage({Key? key, required this.itemId}) : super(key: key);

  @override
  State<CommodityPage> createState() => _CommodityPageState(itemId);
}

class _CommodityPageState extends State<CommodityPage> {

  static const platform = MethodChannel('samples.flutter_app.dev/item');

  int itemId;
  String _itemName = "error";
  String _description = "error";
  double _price = 0;
  String _imagePath = "error";

  _CommodityPageState(this.itemId);

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

  @override
  void initState() {
    super.initState();
    _getItemName();
    _getDescription();
    _getItemPrice();
    _getImagePath();
  }

  @override
  Widget build(BuildContext context) {

    Cart cart = Cart();

    return Scaffold(
      appBar: AppBar(title: Text(_itemName)),
      bottomNavigationBar: ElevatedButton(
        onPressed: () { setState(() {}); cart.addToCart(itemId); },
        child: cart.getQuantityInCart(itemId) == 0 ? Text('Add to cart', style: TextStyle(fontSize: 20)) : Text('Add to cart (${cart.getQuantityInCart(itemId)})', style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
