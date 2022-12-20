import 'user.dart';

class CurrentUser {

  static final CurrentUser currentUser = CurrentUser._internal();
  User? user;
  bool isEntered = false;

  factory CurrentUser() => currentUser;

  CurrentUser._internal();

  setUser(User user) {
    this.user = user;
    isEntered = true;
  }

  delUser() {
    isEntered = false;
  }

}