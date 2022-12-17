import 'package:flutter/material.dart';
import 'package:flutter_app/Commodity_ListItem.dart';
import 'package:flutter_app/CurrentUser.dart';

import '../Cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    cart.addToCart(Commodity_ListItem("lib/Example_Images/image_standart.png", "Danik", 666));
    cart.addToCart(Commodity_ListItem("lib/Example_Images/image_standart.png", "Danik", 666));
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
          itemCount: cart.list.length,
          itemBuilder: (context, index) {
            return cart.list[index];
          }
      ),
    );
  }
}

