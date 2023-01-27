import 'package:clone_trust/app/ui/dashboard_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("My Page"),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Back up your wallet now",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "In the next step, you will see Secret Phrase (12 words) that allows you to recover a wallet.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/img-icons/wallet1.png'),
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "If I lose my secret phrase, my funds will \n be lost forever."),
                        Checkbox(
                          value: _checkbox1,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox1 = value ?? false;
                              _enableButton =
                                  _checkbox1 || _checkbox2 || _checkbox3;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "If I expose or share my secret phrase to \n anybody my funds can get stolen"),
                        Checkbox(
                          value: _checkbox2,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox2 = value ?? false;
                              _enableButton =
                                  _checkbox1 || _checkbox2 || _checkbox3;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Trust Wallet support will NEVER reach \n out to ask for it"),
                        Checkbox(
                          value: _checkbox3,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox3 = value ?? false;
                              _enableButton =
                                  _checkbox1 || _checkbox2 || _checkbox3;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 50,
                      margin:
                          EdgeInsets.only(bottom: 30.00, left: 20, right: 20),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: _enableButton
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage()),
                                );
                              }
                            : null,
                        child: Text("Continue"),
                        color: _enableButton ? Colors.blue : Colors.grey[300],
                        textColor: _enableButton ? Colors.white : Colors.black,
                        disabledColor: Colors.grey[300],
                        disabledTextColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
