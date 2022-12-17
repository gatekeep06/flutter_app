import 'package:flutter_app/commodity_element.dart';

class Cart {

  static final Cart cart = Cart._internal();
  List<CommodityElement> list = <CommodityElement>[];

  factory Cart() => cart;

  Cart._internal();

  addToCart(CommodityElement item) {
    list.add(item);
  }

  removeFromCart(int index) {
    list.removeAt(index);
  }

}