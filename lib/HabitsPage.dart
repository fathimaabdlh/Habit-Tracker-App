import 'dart:async';

import 'package:beu_/utilities/habit_tile.dart';
import 'package:flutter/material.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  // Overall habit list
  List habitList = [
    // [habit name, habit started, time spent (sec), time goal (min)]
    ['Exercise', false, 0, 10],
    ['Read', false, 0, 20],
    ['Meditate', false, 0, 20],
    ['Code', false, 0, 40],
  ];

  void habitStarted(int index) {
// note what the start time is
    var startTime = DateTime.now();
    // print(startTime.second);
    // include the time already elapsed
    int elapsedTime = habitList[index][2];

    //habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });
    if(habitList[index][1] == true
    ){
  //keep the time doing
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // habitList[index][2]++;
        // check when the user has stopped the timer
        if (!habitList[index][1]) {
          timer.cancel();
        }
// calculate the time elapsed by comparing current time and start time
        var currentTime = DateTime.now();
        habitList[index][2] = currentTime.second - startTime.second + 60* (currentTime.minute-startTime.minute) + 60*60*(currentTime.hour - startTime.hour
        );
 
      });
    });
}
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Settings for' + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Consistency is Key.'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          itemCount: habitList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HanitTile(
              habitName: habitList[index][0],
              onTap: () {
                habitStarted(index);
              },
              settingsTapped: () {
                settingsOpened(index);
              },
              habitStarted: habitList[index][1],
              timeSpent: habitList[index][2],
              timeGoal: habitList[index][3],
            );
          },
        ),
      ),
    );
  }
}
