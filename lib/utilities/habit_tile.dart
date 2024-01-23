import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HanitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HanitTile({
    super.key,
    required this.habitName,
    required this.habitStarted,
    required this.onTap,
    required this.settingsTapped,
    required this.timeGoal,
    required this.timeSpent,
  });
// convert seconds into min: sec

  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(5);
//if secs is a digit number,place a 0 infront of it
    if (secs.length == 1) {
      secs = '0' + secs;
    }

    //if mins is a 1 digit number
    if (mins[1] == '.') {
      mins = mins.substring(0, 1);
    }

    return mins + ':' + secs;
  }

// calculate progress percentage
  double percentCompleted() {
    return timeSpent / (timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //circle
            Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    // color: Colors.yellow,
                    child: Stack(
                      children: [
                        //circlebutton
                        Positioned(
                          top: 4,
                          left: 3,
                          child: CircularPercentIndicator(
                            radius: 27,
                            percent: 0.7,
                          ),
                        ),
                        //play pause button
                        Center(
                            child: Icon(
                                habitStarted ? Icons.pause : Icons.play_arrow))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      formatToMinSec(timeSpent) +
                          '/' +
                          timeGoal.toString() +
                          ' = ' +
                         ( percentCompleted()).toStringAsFixed(0)+ '%',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(onTap: settingsTapped, child: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
