import 'package:flutter/material.dart';
import 'package:flutter_app/commodity_element.dart';

import '../cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
          itemCount: cart.getListSize(),
          itemBuilder: (context, index) {
            return CommodityElement(itemId: cart.list[index]);
          }
      )
    );
  }
}

