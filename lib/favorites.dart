import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/current_user.dart';
import 'package:flutter_app/database_writer.dart';

class Favorites {

  static final Favorites favorites = Favorites._internal();
  List list = [];

  factory Favorites() => favorites;

  Favorites._internal();

  addToFavorites(String id) {
    list.add(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'favorites', list);
    }
  }

  removeFromFavorites(String id) {
    list.remove(id);
    if (CurrentUser().isEntered) {
      DataBaseWriter().updateDB('users', CurrentUser().user!.userId, 'favorites', list);
    }
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