import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController textControllerForSearch = TextEditingController();

  int _searchBodyIndex = 0;

  List<String> categories = <String>[
    'category 1',
    'category 2',
    'category 3',
    'category 4',
    'category 5',
    'category 6'
  ];

  List<IconData> categoryIcons = <IconData>[
    Icons.abc,
    Icons.ac_unit_outlined,
    Icons.access_alarm_sharp,
    Icons.accessibility,
    Icons.dangerous,
    Icons.cabin
  ];

  void _onTextChanged(int index) {
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
            return ListTile(title: Text(categories[index]), leading: Icon(categoryIcons[index]));
          }
      ),
      ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Text('data');
          }
      )
    ];

    return Scaffold(
        appBar: AppBar(title: TextField(
          controller: textControllerForSearch,
          onChanged: (inputValue){
            if (inputValue.trim().isEmpty) {
              _onTextChanged(0);
            }
            else {
              _onTextChanged(1);
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
}
