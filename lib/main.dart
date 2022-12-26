import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/favorites.dart';

import 'cart.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isConnectionEstablished = true;
  Favorites favorites = Favorites();
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.amber),
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(alignment: Alignment.center, child: Text("Something went wrong"));
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }
          return Container(alignment: Alignment.center, child: CircularProgressIndicator());
        },
      )
    );

  }

}


