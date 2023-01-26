import 'package:clone_trust/app/ui/ImportCoinList.dart';
import 'package:clone_trust/app/ui/import_form/OtherWalletForm.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  get dataList => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search for coin names",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchQuery = "";
              });
            },
          )
        ],
      ),
      body: _buildSearchResults(),
    );
  }

  Widget _buildSearchResults() {
    List<Data> _searchResults = [];

    if (_searchQuery.isNotEmpty) {
      dataList.forEach((coin) {
        if (coin.coinName.toLowerCase().contains(_searchQuery.toLowerCase())) {
          _searchResults.add(coin);
        }
      });
    }

    if (_searchResults.length == 0) {
      return Center(
        child: Text("No results found"),
      );
    } else {
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherWalletForm(
                      key: UniqueKey(),
                      index: index,
                      coinName: _searchResults[index].coinName ?? "",
                      coinImage: _searchResults[index].imageURL ?? "",
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              AssetImage(_searchResults[index].imageURL ?? ""),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(_searchResults[index].coinName ?? "")
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
