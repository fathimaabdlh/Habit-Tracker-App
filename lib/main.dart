import 'package:beu_/main pages/firstPage.dart';
import 'package:beu_/main pages/thirdPage.dart';
import 'package:beu_/main%20pages/newprofilepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize Hive
  await Hive.initFlutter();

  // Open a box
  await Hive.openBox('Habit_Database');

  await Hive.openBox(UserData.boxName);

  // Check if the user has seen the intro pages
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showIntro = prefs.getBool('showIntro') ?? true;

  runApp(MyApp(showIntro: showIntro));
}

class MyApp extends StatelessWidget {
  final bool showIntro;

  const MyApp({Key? key, required this.showIntro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: showIntro ? FirstPage() : ThirdPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}

