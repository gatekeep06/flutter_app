import 'package:flutter_app/current_user.dart';
import 'package:flutter_app/database_writer.dart';

class CurrentOrders {

  static final CurrentOrders currentOrders = CurrentOrders._internal();
  List list = [];

  factory CurrentOrders() => currentOrders;

  CurrentOrders._internal();

  addToCurrentOrders(String id) {
    list.add(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'current_orders', list);
    }
  }

  removeFromCart(String id) {
    list.remove(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'current_orders', list);
    }
  }

}