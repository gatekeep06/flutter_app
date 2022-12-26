import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Cart.dart';

class CommodityPage extends StatefulWidget {

  final String itemId;
  final String itemName;
  final String description;
  final double price;
  final String imagePath;

  const CommodityPage({Key? key, required this.itemId, required this.itemName, required this.description, required this.price, required this.imagePath}) : super(key: key);

  @override
  State<CommodityPage> createState() => _CommodityPageState(itemId, itemName, description, price, imagePath);
}

class _CommodityPageState extends State<CommodityPage> {

  static const platform = MethodChannel('samples.flutter_app.dev/item');

  String itemId;
  String _itemName;
  String _description;
  double _price;
  String _imagePath;

  _CommodityPageState(this.itemId, this._itemName, this._description, this._price, this._imagePath);

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
                  child: Text('$_price \$', style: TextStyle(fontSize: 50, color: Colors.white))
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
