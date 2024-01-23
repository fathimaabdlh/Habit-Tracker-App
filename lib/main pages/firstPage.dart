import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beu_/main%20pages/secondPage.dart';
import 'package:beu_/utilities/heartButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
   bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 222, 243, 103),
                    Color.fromARGB(255, 249, 248, 236),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            )),
        Positioned(
          top: 140,
          left: 20,
          child: Container(
            height: 380,
            width: 380,
            decoration: BoxDecoration(),
            child:
                Lottie.asset('Assets/imagestwo/blue.json', fit: BoxFit.contain),
          ),
        ),
        Positioned(top: 200, left: 45, child: _rotate()),
        Padding(
          padding: const EdgeInsets.only(top: 800.0),
          child:Container(
          height: 50,
          width: 500,
          
          child: SwipeableButtonView(
            activeColor: Color.fromARGB(255, 238, 242, 215),
              buttonWidget: Icon(
              Icons.favorite_border_outlined,
              color: const Color.fromARGB(255, 249, 199, 199),
            ),
            buttonText: 'Lets Go..!',
            buttontextstyle: TextStyle(fontSize: 25,
            fontWeight: FontWeight.w600,
             color: Color.fromARGB(255, 15, 14, 14)),
          
           
            onWaitingProcess: () {
              Future.delayed(
                  Duration(seconds: 2), () => setState(() => isFinished = true));
            },
            isFinished: isFinished,
            onFinish: () async {
              await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: SecondPage()));
              setState(() => isFinished = false);
            },
          ),
        ),

        )
      ],
    )));
  }

  Widget _rotate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
          height: 100,
        ),
        Text(
          'MORE',
          style: TextStyle(
              fontSize: 37, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        DefaultTextStyle(
            style: TextStyle(
                fontSize: 45, color: Colors.black, fontWeight: FontWeight.w800),
            child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  RotateAnimatedText('Healthy'),
                  RotateAnimatedText('Positive'),
                  RotateAnimatedText('Energetic'),
                  RotateAnimatedText('Happiness'),
                ]))
      ],
    );
  }
}
