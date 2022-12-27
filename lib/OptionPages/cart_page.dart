import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commodity_element.dart';
import 'package:flutter_app/commodity_element_creator.dart';
import 'package:flutter_app/current_orders.dart';
import 'package:flutter_app/current_user.dart';
import 'package:flutter_app/database_writer.dart';

import '../Cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  Cart cart = Cart();

  doPurchase() {
    Cart().getCartPrice();
    DataBaseWriter().addToDB('orders', {'items': Cart().list, 'price': Cart().price});
    Cart().list.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: CommodityElementCreator().createCommodityElementByIdList(cart.list),
      floatingActionButton: FloatingActionButton(
        onPressed: () { setState(() {
          doPurchase();
        }); },
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.shopping_cart_outlined),
      )
    );
  }
}

