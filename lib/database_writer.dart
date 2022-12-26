import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/user.dart';

class DataBaseWriter {

  addToDB(String table, var values) async {
    await FirebaseFirestore.instance.collection(table).add(values);
  }

  updateDB(String table, String itemId, String field, var values) async {
    await FirebaseFirestore.instance.collection(table).doc(itemId).update({field: values});
  }

}