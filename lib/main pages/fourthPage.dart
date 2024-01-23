import 'package:beu_/intro_screen/introFifth.dart';
import 'package:beu_/intro_screen/introFour.dart';
import 'package:beu_/intro_screen/introOne.dart';
import 'package:beu_/intro_screen/introSixth.dart';
import 'package:beu_/intro_screen/introThree.dart';
import 'package:beu_/intro_screen/introTwo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(6);
                },
                child: Text('skip')),
              SmoothPageIndicator(controller: _controller, count: 5),
              GestureDetector(
                onTap:() {
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
                child: Text('next'))
            ],
          )), 
      
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
             
            
              
      
             IntroOne(),
              IntroTwo(),
             IntroThree(),
              IntroFour(),
              IntroFifth(),
              SurveyForm(),
              

              
            ],
          ),
        ],
      ),
    );
  }

  
  }






