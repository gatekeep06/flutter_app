import 'package:flutter/material.dart';

import '../commodity_element.dart';
import '../favorites.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  Favorites favorites = Favorites();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: ListView.builder(
            itemCount: favorites.getListSize(),
            itemBuilder: (context, index) {
              return CommodityElement(itemId: favorites.list[index]);
            }
        )
    );
  }
}

