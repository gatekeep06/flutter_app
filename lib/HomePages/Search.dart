import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/commodity_element.dart';
import 'package:flutter_app/commodity_element_creator.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController textControllerForSearch = TextEditingController();

  int _searchBodyIndex = 0;
  List searchResults = [];
  String selectedCategory = "none";

  List<String> categories = <String>[
    'kitchen appliances',
    'decor',
    'household chemicals',
    'furniture',
    'misc',
  ];

  List<IconData> categoryIcons = <IconData>[
    Icons.soup_kitchen,
    Icons.deck,
    Icons.water_drop,
    Icons.table_restaurant,
    Icons.abc,
  ];

  void _setSearchState(int index) {
    setState(() {
      _searchBodyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> searchState = <Widget>[
      ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(categories[index]),
              leading: Icon(categoryIcons[index]),
              onTap: () {
                setState(() {
                  selectedCategory = categories[index];
                });
              },
            );
          }
      ),
      StreamBuilder(
          stream: FirebaseFirestore.instance.collection('items2').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done &&
                snapshot.connectionState != ConnectionState.active) {
              return Container(alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
            searchResults.clear();
            for (var i in snapshot.data!.docs) {
              if (i.get('name').toString().toLowerCase().contains(
                  textControllerForSearch.text.toLowerCase())) {
                searchResults.add(i.id);
              }
            }
            return CommodityElementCreator().createCommodityElementByIdList(
                searchResults);
          }
      )
    ];

    if (selectedCategory == "none") {
      return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: textControllerForSearch,
              onChanged: (inputValue) {
                if (inputValue
                    .trim()
                    .isEmpty) {
                  _setSearchState(0);
                }
                else {
                  _setSearchState(1);
                }
              },
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: UnderlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
          ),
          body: searchState.elementAt(_searchBodyIndex)

      );
    }
    else {
      return WillPopScope(
          onWillPop: () async {
            setState(() {
              selectedCategory = "none";
            });
            return false;
          },
          child: Scaffold(
              appBar: AppBar(title: Text(selectedCategory)),
              body: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('items').snapshots(),
                  builder: (context, snapshot) {
                    searchResults.clear();
                    if (snapshot.connectionState != ConnectionState.done && snapshot.connectionState != ConnectionState.active) {
                      return Container(alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    }
                    for (var i in snapshot.data!.docs) {
                      if (i.get('category').toString().toLowerCase().contains(selectedCategory)) {
                        searchResults.add(i.id);
                      }
                    }
                    return CommodityElementCreator().createCommodityElementByIdList(searchResults);
                  }
              )
          )
      );
    }
  }
}
