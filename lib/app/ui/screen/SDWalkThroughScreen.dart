import 'package:clone_trust/app/ui/ImportCoinList.dart';
import 'package:clone_trust/app/ui/screen/RegisterPage.dart';
import 'package:clone_trust/utils/SDColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:onthegoapp/main/users/SDLoginScreen.dart';

class SDWalkThroughScreen extends StatefulWidget {
  @override
  _SDWalkThroughScreenState createState() => _SDWalkThroughScreenState();
}

class _SDWalkThroughScreenState extends State<SDWalkThroughScreen> {
  bool? isActive;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(i == pageChanged
          ? sDDotIndicator(isActive: true)
          : sDDotIndicator(isActive: false));
    }

    return list;
  }

  Widget sDDotIndicator({required bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 8.0 : 6.0,
      width: isActive ? 8.0 : 6.0,
      decoration: BoxDecoration(
          color: isActive ? sdPrimaryColor : Color(0xFF7E869B),
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: size.height * 0.7,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    pageChanged = index;
                  });
                },
                controller: pageController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('assets/img-icons/wallet1.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text('Priavte & Secure',
                                textAlign: TextAlign.center,
                                style: boldTextStyle(size: 25))),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text('Private keys never leaves your device',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('assets/img-icons/wallet2.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('All assets in one place',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text('View and store your assets seamlessly',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('assets/img-icons/wallet3.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Trade assets',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text('Trade your assets anonymousely',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('assets/img-icons/wallet4.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Explore decentralized apps',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                            'Earn, explore, utilize, spend, trade, and more',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildDotIndicator()),
            ),
            Container(
              margin: EdgeInsets.all(20.00),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30.00, left: 20, right: 20),
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: sdPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 1,
                      ),
                      onPressed: () {
                        finish(context);
                        RegisterPage().launch(context);
                      },
                      child: Text(
                        "CREATE A NEW ACCOUNT",
                        textAlign: TextAlign.center,
                        style: boldTextStyle(
                            size: 14, color: Colors.white, letterSpacing: 2),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportCoinList()));
                    },
                    child: Text(
                      "I already have a wallet",
                      style: boldTextStyle(
                          size: 14, color: sdPrimaryColor, letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
