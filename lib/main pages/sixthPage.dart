
import 'package:beu_/main%20pages/sevenHomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({super.key});
  


  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
bool isConfirmed = false;
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      body: Stack(
        children: [
          // Container(
          //   height: 30,
          //   width: 30,
          //   child: Lottie.asset('Assets/imagestwo/heart.json')),
        Positioned(
          top: 120,
          left: 30,
          child: Text('Lets make a\ncontract',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),),
        ),
        Positioned(
          top: 260,
          left: 30,
          child: Text('⚫ I will achieve my goal!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
         Positioned(
          top: 300,
          left: 30,
          child: Text('⚫ I will make the mose of my day!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
         Positioned(
          top: 340,
          left: 30,
          child: Text('⚫ I will keep my life organized!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
         Positioned(
          top: 380,
          left: 30,
          child: Text('⚫ I will be worry-free!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
         Positioned(
          top: 420,
          left: 30,
          child: Text('⚫ I will be more productive!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
        Positioned(
          top: 460,
          left: 30,
          child: Text('⚫ I will be the best version of my-self!',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20
            ),),
        ),
      //  RippleButton(),
      Positioned(
        top: 600,
        left: 120,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
            HomePage( )));
          },
          child: RippleAnimation(
                child: 
                CircleAvatar(
                  minRadius: 75,
                  maxRadius: 75,
                  backgroundColor: Colors.deepPurple[300],
                  child: Text('Press to confirm',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                //  backgroundImage: NetworkImage(Constants.avtarUrl),
                ),
                color: Colors.deepPurpleAccent,
                delay: const Duration(milliseconds: 300),
                repeat: true,
                minRadius: 75,
                ripplesCount: 6,
                duration: const Duration(milliseconds: 6 * 300),
              ),
        ),
      )

        ],
      ),
      
    );
  }
  Future<void> saveConfirmationStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isConfirmed', value);
  }

}

