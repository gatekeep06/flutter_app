import 'package:json_annotation/json_annotation.dart';

import 'Cart.dart';
import 'favorites.dart';

class User {

  String userId;
  String profileImage;
  String firstName;
  String lastName;
  String telNumber;
  String login;
  String password;
  Favorites favorites = Favorites();
  Cart cart = Cart();

  User(this.userId, this.profileImage, this.firstName, this.lastName, this.telNumber, this.login, this.password, List favoritesList, List cartList) {
    favorites.list = favoritesList;
    cart.list = cartList;
  }

}