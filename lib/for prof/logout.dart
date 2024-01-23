import 'package:beu_/main%20pages/firstPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: ElevatedButton(
  onPressed: () async {
    try {
      print('Logging out...');
      await FirebaseAuth.instance.signOut();
      print('User logged out');
    } catch (e) {
      print('Error during log-out: $e');
    }
  },
  child: Text('Log Out'),
)


      ),
    );
  }
}
