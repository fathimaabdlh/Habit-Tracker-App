import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beu_/main%20pages/firstPage.dart';
import 'package:beu_/main%20pages/sixthPage.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  late bool organizeDay; // Variable to track the user's choice

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the user's choice from SharedPreferences, default to false if not found
    bool organizeDayValue = prefs.getBool('organizeDay') ?? false;
    setState(() {
      organizeDay = organizeDayValue;
    });
  }

  Future<void> savePreferences(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('organizeDay', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 40,
            child: Text(
              'Do you want to organize\n        your day?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Container(
              height: 650,
              width: 600,
              child: Image.asset('Assets/imagestwo/battery-removebg-preview.png'),
            ),
          ),
          Positioned(
            top: 750,
            left: 30,
            child: GestureDetector(
              onTap: () async {
                // Save the user's choice and navigate to the appropriate page
                await savePreferences(false);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 740,
            right: 30,
            child: GestureDetector(
              onTap: () async {
                // Save the user's choice and navigate to the appropriate page
                await savePreferences(true);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SixthPage(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Sure! Lets go!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

