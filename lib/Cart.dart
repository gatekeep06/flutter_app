import 'package:cloud_firestore/cloud_firestore.dart';

import 'current_user.dart';
import 'database_writer.dart';

class Cart {

  static final Cart cart = Cart._internal();
  List list = [];
  double price = 0;

  factory Cart() => cart;

  Cart._internal();

  addToCart(String id) {
    list.add(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'cart', list);
    }
  }

  removeFromCart(String id) {
    list.remove(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'cart', list);
    }
  }

  int getQuantityInCart(String id) {
    int quantity = 0;
    for (String i in list) {
      if (i == id) {
        quantity++;
      }
    }
    return quantity;
  }
  
  getCartPrice() async {
    price = 0;
    var db = (await FirebaseFirestore.instance.collection('items2').get()).docs;
    for (var i in db) {
      for (var j in list) {
        if (j == i.id) {
          price += i.get('price');
        }
      }
    }
  }

  int getListSize() {
    return list.length;
  }

}