import 'package:flutter/material.dart';
import '../current_orders.dart';
import '../commodity_element_creator.dart';

class CurrentOrdersPage extends StatefulWidget {
  const CurrentOrdersPage({Key? key}) : super(key: key);

  @override
  State<CurrentOrdersPage> createState() => _CurrentOrdersPageState();
}

class _CurrentOrdersPageState extends State<CurrentOrdersPage> {
  @override
  Widget build(BuildContext context) {

    CurrentOrders currentOrders = CurrentOrders();

    return Scaffold(
        appBar: AppBar(title: Text('Current Orders')),
        body: CommodityElementCreator().createCommodityElementByIdList(currentOrders.list)
    );
  }
}

