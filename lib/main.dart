import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepOrange),
        focusColor: Colors.grey
      ),
      home: Home(),
    );
  }
}


