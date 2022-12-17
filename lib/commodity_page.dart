import 'package:flutter/material.dart';

class CommodityPage extends StatelessWidget {

  //List<String> Images = <String>["lib/Example_Images/image_standart.png","lib/Example_Images/image_standart.png","lib/Example_Images/image_standart.png","lib/Example_Images/image_standart.png"]

  CommodityPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
      ),
      /*body: Column(
        children: [

          ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Images[index],
                )
              }
          )
        ],
      ),*/
    );
  }
}
