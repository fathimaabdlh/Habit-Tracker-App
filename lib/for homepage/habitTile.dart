import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class HabitTile extends StatelessWidget {
  const HabitTile(
      {super.key,
      required this.deleteTapped,
      required this.settingsTapped,
      required this.habitCompleted,
      required this.habitName,
      required this.onChanged, required DateTime selectedDate});
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
 final Function(BuildContext)? settingsTapped;
 final Function(BuildContext)? deleteTapped;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            //settings option
            SlidableAction(onPressed:settingsTapped,
            backgroundColor:Colors.grey.shade900 ,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12),
            ),
            //delete option
            SlidableAction(onPressed:deleteTapped,
            backgroundColor:Colors.deepPurple ,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
            ),
          ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
          child: Row(
            children: [
              //check box
              Checkbox(value: habitCompleted, onChanged: (onChanged)),

              //habit name
              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}
