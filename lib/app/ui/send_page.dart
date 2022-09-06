import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  static const routeName = '/send';
  const SendPage({Key? key}) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Send')),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
