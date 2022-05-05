import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<void> _searching(productName) async {
    await Provider.of<HomeProvider>(context, listen: false).search(productName);
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              autofocus: false,
              controller: search,
              
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: () {
                      print(search.text);
                      _searching(search.text);
                    },
                    icon: Icon(Icons.forward)),
                hintText: 'Search',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
