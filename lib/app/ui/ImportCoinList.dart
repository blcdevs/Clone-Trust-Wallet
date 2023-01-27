import 'package:clone_trust/app/ui/import_form/MainWalletForm.dart';
import 'package:clone_trust/app/ui/import_form/OtherWalletForm.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

const _url =
    'https://community.trustwallet.com/t/how-to-import-a-wallet-our-top-tips-to-do-so-securely/87';

class ImportCoinList extends StatelessWidget {
  List<Data> dataList = [
    Data(
        coinName: "Multi-Coin Wallet",
        imageURL: 'assets/coins/trustwallet.png'),
    Data(coinName: "Aeternity Wallet", imageURL: 'assets/coins/aeternity.png'),
    Data(coinName: "Aion Wallet", imageURL: 'assets/coins/aion.png'),
    Data(coinName: "Algorand Wallet", imageURL: 'assets/coins/algorand.png'),
    Data(coinName: "Aptos Wallet", imageURL: 'assets/coins/aptos.png'),
    Data(coinName: "Arbitrum Wallet", imageURL: 'assets/coins/arbitrum.jpg'),
    Data(coinName: "Cosmos Hub Wallet", imageURL: 'assets/coins/cosmos.png'),
    Data(coinName: "Aurora Wallet", imageURL: 'assets/coins/aurora.jpeg'),
    Data(
        coinName: "Avalanche C-Chain Wallet",
        imageURL: 'assets/coins/avalanche.png'),
    Data(coinName: "Bitcoin Wallet", imageURL: 'assets/coins/btc.png'),
    Data(coinName: "Bitcoin Cash Wallet", imageURL: 'assets/coins/bitcash.png'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Import'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // handle search action
            },
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/img-icons/link.png"),
              color: Colors.white,
              size: 24,
            ),
            onPressed: _launchURL,
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainWalletForm(
                            key: UniqueKey(),
                            index: index,
                            coinName: dataList[index].coinName ?? "",
                            coinImage: dataList[index].imageURL ?? "",
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
                                    AssetImage(dataList[index].imageURL ?? ""),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(dataList[index].coinName ?? "")
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtherWalletForm(
                          key: UniqueKey(),
                          index: index,
                          coinName: dataList[index].coinName ?? "",
                          coinImage: dataList[index].imageURL ?? "",
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
                              image: AssetImage(dataList[index].imageURL ?? ""),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(dataList[index].coinName ?? "")
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Data {
  String? coinName;
  String? imageURL;

  Data({this.imageURL, this.coinName});
}

Future<bool> _isConnected() async {
  var result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    return false;
  }
  return true;
}

void _launchURL() async {
  if (await _isConnected()) {
    if (await canLaunch(_url)) {
      await launch(_url);
    }
  } else {
    print("Device not connected to the internet");
    // Show message to user
  }
}
