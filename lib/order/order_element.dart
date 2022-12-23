import 'package:flutter/material.dart';

class OrderElement extends StatelessWidget {

  final String orderNumber;
  final String status;
  final String date;
  final double price;

  const OrderElement(this.orderNumber, this.status, this.date, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
