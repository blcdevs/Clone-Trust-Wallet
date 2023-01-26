import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';

class WalkThroughScreen extends StatelessWidget {
  /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */
  final List<OnbordingData> list = [
    const OnbordingData(
      image: AssetImage("assets/img-icons/reminder1.png"),
      titleText: Text("This is Title1"),
      descText: Text("This is desc1"),
    ),
    const OnbordingData(
      image: AssetImage("assets/img-icons/reminder2.png"),
      titleText: Text("This is Title2"),
      descText: Text("This is desc2"),
    ),
    const OnbordingData(
      image: AssetImage("assets/img-icons/reminder3.png"),
      titleText: Text("This is Title3"),
      descText: Text("This is desc4"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroScreen(
      onbordingDataList: list,
      colors: const [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],
      //  pageRoute: MaterialPageRoute(
      //    builder: (context) => NextPage(),
      //  ),
      nextButton: const Text(
        "NEXT",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      lastButton: const Text(
        "GOT IT",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      skipButton: const Text(
        "SKIP",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      selectedDotColor: Colors.orange,
      unSelectdDotColor: Colors.grey,
    );
  }
}
