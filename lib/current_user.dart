import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

class CurrentUser {

  static final CurrentUser currentUser = CurrentUser._internal();
  User? user;
  bool isEntered = false;
  bool rememberMe = false;

  factory CurrentUser() => currentUser;

  CurrentUser._internal();

  setUser(User user) {
    this.user = user;
    isEntered = true;
  }

  delUser() {
    isEntered = false;
    user = null;
  }

}