import 'current_user.dart';
import 'database_writer.dart';

class Cart {

  static final Cart cart = Cart._internal();
  List<String> list = <String>[];

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

  int getListSize() {
    return list.length;
  }

}