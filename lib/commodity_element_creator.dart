import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'commodity_element.dart';

class CommodityElementCreator {

  Widget createCommodityElementByIdList(List idList) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('items').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
          if (idList.isEmpty) {
            return Container(
                alignment: Alignment.center, child: Text('There doesn\'t seem to be anything here'));
          }
          else {
            return ListView.builder(
                itemCount: idList.length,
                itemBuilder: (context, index) {
                  return CommodityElement(
                      itemId: idList[index],
                      itemName: snapshot.data?.docs[snapshot.data!.docs.indexWhere((element) => element.id == idList[index])].get("name"),
                      price: snapshot.data?.docs[snapshot.data!.docs.indexWhere((element) => element.id == idList[index])].get("price"),
                      imagePath: snapshot.data?.docs[snapshot.data!.docs.indexWhere((element) => element.id == idList[index])].get("image_path")
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