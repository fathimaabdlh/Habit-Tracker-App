import 'package:beu_/intro_screen/introOne.dart';
import 'package:beu_/main%20pages/thirdPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return IntroOne();
          } else {
            return ThirdPage();
          }
        },
        // builder: (context, snapshot) {
        //   if (snapshot.hasError) {
        //     print("Authentication Error: ${snapshot.error}");
        //   }

        //   if (snapshot.hasData) {
        //     return IntroOne();
        //   } else {
        //     return ThirdPage();
        //   }
        // },
      ),
    );
  }
}
