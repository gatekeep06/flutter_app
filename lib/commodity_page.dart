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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 250,
                    width: 400,
                    child: Image.network(_imagePath, fit: BoxFit.scaleDown),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2)))
                )
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(_itemName, style: TextStyle(fontSize: 35)),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: 400,
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 193, 7), borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('$_price \$', style: TextStyle(fontSize: 50))
              )
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Container(
              width: 400,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(_description, style: TextStyle(fontSize: 20))
              )
            )
          ],
        ),
      ),

      bottomNavigationBar:
      cart.getQuantityInCart(itemId) == 0 ? ElevatedButton(onPressed: () { setState(() {}); cart.addToCart(itemId); }, child: Text('Add to cart', style: TextStyle(fontSize: 20))
      ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () { setState(() {}); cart.removeFromCart(itemId); }, child: Text('Remove from cart', style: TextStyle(fontSize: 20))),
            ElevatedButton(onPressed: () { setState(() {}); cart.addToCart(itemId); }, child: Text('Add to cart (${cart.getQuantityInCart(itemId)})', style: TextStyle(fontSize: 20)))
          ],
        )
    );
  }
}
