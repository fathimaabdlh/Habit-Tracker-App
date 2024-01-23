import 'package:beu_/button.dart';
import 'package:beu_/main%20pages/secondPage.dart';
import 'package:flutter/material.dart';

class NewBuuton extends StatelessWidget {
  const NewBuuton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Positioned(
          bottom: 2,
          child: Container(
            height: 350,
            width: 425,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 248, 255),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:100.0,top: 40),
                  child: Text('Hi welcome ❤️',style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.only(top:30.0,left: 40),
                  child: Text("The most comprehensive & consistant \n               routine planner",style: TextStyle(
                    color: Colors.black,
                    letterSpacing:BorderSide.strokeAlignOutside,
                    fontSize: 19,
                    fontWeight: FontWeight.w500
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left:180.0,top: 90),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      const SecondPage()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      child: HeartButton())
                  ),
                )
              ],
            ),
          ),
        );
  }
}