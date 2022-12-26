import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../commodity_element.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('items').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
          if (!snapshot.hasData) {
            return Container(alignment: Alignment.center, child: Text('Catalog is empty'));
          }
          else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return CommodityElement(
                      itemId: snapshot.data!.docs[index].id,
                      itemName: snapshot.data!.docs[index].get("name"),
                      description: snapshot.data!.docs[index].get("description"),
                      price: snapshot.data!.docs[index].get("price"),
                      imagePath: snapshot.data!.docs[index].get("image_path")
                  );
                }
            );
          }
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(alignment: Alignment.center, child: CircularProgressIndicator());
        }
        else {
          return Text("Something went wrong");
        }
      },
    );
  }
}