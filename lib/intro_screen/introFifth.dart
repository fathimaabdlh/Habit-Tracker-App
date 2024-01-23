import 'package:beu_/main%20pages/fifthPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroFifth extends StatelessWidget {
  const IntroFifth({super.key});
  Future<void> checkShowIntro(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (!showIntro) {
      // If intro has already been seen, navigate to the main content
      // Replace 'FifthPage()' with your actual main content widget
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FifthPage()));
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
        ),
        Positioned(
          left: 40,
          top: 25,
          child: const Text(
            'Future self become the\n     one You admire',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Positioned(
          top: 140,
          left: 20,
          child: Container(
            height: 380,
            width: 380,
            decoration: BoxDecoration(),
            child: Image.asset(
                'Assets/imagestwo/clip-happy-girl-with-shopping-bags.png',
                fit: BoxFit.contain),
          ),
        ),
        Positioned(
          top: 155,
          right: 43,
          child: Container(
              height: 50,
              width: 50,
              child: Image.asset('Assets/imagestwo/pen2.png')),
        ),
        Positioned(
            right: 20,
            top: 200,
            child: Text(
              '     Life\norganised',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        Positioned(
          top: 155,
          left: 50,
          child: Container(
              height: 50,
              width: 50,
              child: Image.asset('Assets/imagestwo/sand.png')),
        ),
        Positioned(
            left: 20,
            top: 200,
            child: Text(
              ' Productive    ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        Positioned(
          top: 420,
          left: 20,
          child: Container(
              height: 50,
              width: 50,
              child: Image.asset('Assets/imagestwo/bulb.jpeg')),
        ),
        Positioned(
            left: 20,
            top: 480,
            child: Text(
              ' More\nEnergitic',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        Positioned(
          top: 450,
          right: 60,
          child: Container(
              height: 60,
              width: 60,
              child: Image.asset('Assets/imagestwo/flag.png')),
        ),
        Positioned(
            right: 38,
            top: 495,
            child: Text(
              ' Fabulous\nchanges',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
         Positioned(
              left: 28,
              top: 600,
              child: Text(
                '          The users claim fabulous\nimprovement and meet the better self as\n         science-based programme',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  setIntroShown(); // Set shared preferences to mark intro as shown
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => FifthPage(),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Customize the button color
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Start Exploring',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 //  Positioned(
        // top: 250,
        // left: 45,
        // child: _rotate()),
        //   Padding(
        //     padding: const EdgeInsets.only(top:855.0),
        //     child: SlidePage(),
        //   )