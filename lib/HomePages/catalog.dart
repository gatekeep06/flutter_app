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

  static const platform = MethodChannel('samples.flutter_app.dev/item');

  int _catalogSize = 2;
  
  Future<void> _getCatalogSize() async {
    int result;
    try {
      result = await platform.invokeMethod('getCatalogSize');
    } on PlatformException catch (e) {
      result = 1;
    }

    setState(() {
      _catalogSize = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCatalogSize();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: _catalogSize,
      itemBuilder: (context, id) {
        return CommodityElement(itemId: id);
      },
    );
  }
}
