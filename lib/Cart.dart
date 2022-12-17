import 'package:flutter_app/Commodity_ListItem.dart';

class Cart {

  static final Cart cart = Cart._internal();
  List<Commodity_ListItem> list = <Commodity_ListItem>[];

  factory Cart() => cart;

  Cart._internal();

  addToCart(Commodity_ListItem item) {
    list.add(item);
  }

  removeFromCart(int index) {
    list.removeAt(index);
  }

}