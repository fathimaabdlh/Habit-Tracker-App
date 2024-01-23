
import 'package:beu_/main%20pages/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _LogInState();
}

class _LogInState extends State<SlidePage> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

        // floatingActionButton: FloatingActionButton.extended(

        //   tooltip: 'Welcome guys..',
        //   elevation: 10.0,
        //   foregroundColor: Colors.cyanAccent,
        //   backgroundColor: Colors.indigo,
        //   label: Text('Home'),
        //   icon: Icon(Icons.home),
        //   onPressed: (){},
        //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10),
        //   side: BorderSide(color: Colors.lightBlue)), ),
        body: Container(
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

    
    );
  }
}

