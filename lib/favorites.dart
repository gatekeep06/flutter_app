import 'package:flutter/services.dart';

class Favorites {

  static final Favorites favorites = Favorites._internal();
  List<String> list = <String>[];

  factory Favorites() => favorites;

  Favorites._internal();

  addToFavorites(String id) {
    list.add(id);
  }

  removeFromFavorites(String id) {
    list.remove(id);
  }

  bool isInFavorites(String id) {
    for (String i in list) {
      if (i == id) {
        return true;
      }
    }
    return false;
  }

  int getListSize() {
    return list.length;
  }
}