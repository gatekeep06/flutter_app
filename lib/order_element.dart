import 'package:flutter/material.dart';
import 'package:flutter_app/order_page.dart';

class OrderElement extends StatefulWidget {

  final String orderId;
  final double price;
  final List items;

  const OrderElement({Key? key, required this.orderId, required this.price, required this.items}) : super(key: key);

  @override
  State<OrderElement> createState() => _OrderElementState(orderId, price, items);
}

class _OrderElementState extends State<OrderElement> {

  String _orderId;
  double _price;
  List _items;

  _OrderElementState(this._orderId, this._price, this._items)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
            },
            child: Row(
            children: [
              Text("Order id: $_orderId", style: TextStyle(fontSize: 10)),
              Expanded(child: Align(alignment: Alignment.topRight, child: Text('$_price \$')))
            ],
          ),
        ),
      ),
    );
  }
}
