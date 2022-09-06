import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  static const routeName = '/buy';
  const BuyPage({Key? key}) : super(key: key);

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Buy')),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
