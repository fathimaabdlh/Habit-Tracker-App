import 'package:beu_/main%20pages/thirdPage.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  HeartButton({super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isButtonPressed = false;

  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed == false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ThirdPage(),
        ));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 290),
        child: Container(
          height: 80,
          width: 80,
          child: Icon(
            Icons.arrow_forward,
            size: 30,
            color: Colors.red[800],
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              boxShadow: isButtonPressed
                  ? []
                  : [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(6, 6),
                          blurRadius: 5,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 15,
                          spreadRadius: 1)
                    ]),
        ),
      ),
    );
  }
}
