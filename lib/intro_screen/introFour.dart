
import 'package:beu_/intro_screen/introFifth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroFour extends StatelessWidget {
  const IntroFour({super.key});
  
  Future<void> checkShowIntro(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (!showIntro) {
      // If intro has already been seen, navigate to the main content
      // Replace 'IntroFifth()' with your actual main content widget
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroFifth()));
    }
  }

  Future<void> setIntroShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showIntro', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration()),
        Positioned(
          top: 140,
          left: 20,
          child: Container(
            height: 380,
            width: 380,
            decoration: BoxDecoration(),
            child:
                Image.asset('Assets/imagestwo/brain.jpeg', fit: BoxFit.contain),
          ),
        ),
        Icon(
          Icons.undo,
          color: Colors.black,
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Text(
            'Build Good Habits Based\n  on Behavior Science',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Positioned(top: 320, left: 60, child: Icon(Icons.undo)),
        Positioned(
            top: 220, left: 65, child: Icon(Icons.switch_access_shortcut)),
        Positioned(top: 250, right: 40, child: Icon(Icons.arrow_outward_sharp)),
        Positioned(top: 370, right: 140, child: Icon(Icons.arrow_downward)),
        Positioned(
          top: 160,
          left: 10,
          child: Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              'Motivation controller',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Positioned(
          top: 145,
          right: 5,
          child: Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              'Goal Directed\n system',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )),
          ),
        ),
        Positioned(
          top: 350,
          left: 5,
          child: Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              'Energy\nsystem',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Positioned(
          top: 400,
          right: 80,
          child: Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              'Habit system',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Positioned(
          bottom: 2,
          child: Container(
            height: 350,
            width: 425,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 248, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 80,
                  child: Text(
                    "3X times more succesful than\n others in achieving goals by\nbehavioral science.",
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: BorderSide.strokeAlignOutside,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Positioned(
                  top: 100,
                  left: 80,
                  child: Text(
                    "The users responded\nthat building a good habit\nscoentifically is easier and more\neffective.",
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: BorderSide.strokeAlignOutside,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
               
                Positioned(
                  top: 100,
                  left: 10,
                  child: Container(
                      height: 30,
                      width: 30,
                      child: Lottie.asset('Assets/imagestwo/tic.json')),
                ),
                
            Positioned(
              top: 15,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  setIntroShown(); // Set shared preferences to mark intro as shown
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => IntroFifth(),
                  ));
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child: Lottie.asset('Assets/imagestwo/tic.json'),
                ),
              ),
            )
          ],
        ),
      ),)
      ])
      )
      );
  }
}
