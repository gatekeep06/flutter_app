import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/user.dart';

class DataBaseWriter {

  addToDB(String table, var values) {
    FirebaseFirestore.instance.collection(table).add(values);
  }
  
  addUserAccountToDB(User user) {
    addToDB('users', {'first_name': user.firstName, 'last_name': user.lastName, 'number': user.telNumber, 'login': user.login, 'password': user.password});
  }

  //addFavoritesToDB(User user)

}