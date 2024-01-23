import 'package:beu_/main%20pages/past_habits.dart';
import 'package:flutter/material.dart';
import 'package:beu_/for%20homepage/habit_database.dart';
import 'package:beu_/for%20homepage/habitTile.dart';
import 'package:beu_/for%20homepage/montly_summary.dart';
import 'package:beu_/for%20homepage/my_alert_box.dart';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HomePageTwo extends StatefulWidget {
  const HomePageTwo({Key? key}) : super(key: key);

  @override
  State<HomePageTwo> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTwo> {
  HabitDatabase? db; // Use the null-aware operator
  final TextEditingController _newHabitNameController = TextEditingController();
  final _myBox = Hive.box("Habit_Database");
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    db = HabitDatabase(); // Use the null-aware operator
    initializeAppState();
    super.initState();
  }

  void initializeAppState() {
    if (db == null) {
      db = HabitDatabase();
    }

    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db!.createDefaultData();
    } else {
      db!.loadData();
    }
    db!.updateDatabase();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db!.todaysHabitList![index][1] = value;
    });
    db!.updateDatabase();
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter habit name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  void saveNewHabit() {
    setState(() {
      db!.todaysHabitList!
          .add([_newHabitNameController.text, false, DateTime.now()]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db!.updateDatabase();
  }

  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db!.todaysHabitList![index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      db!.todaysHabitList![index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db!.updateDatabase();
  }

  void deleteHabit(int index) {
    setState(() {
      db!.todaysHabitList!.removeAt(index);
    });
    db!.updateDatabase();
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Navigate to PastHabitsPage with selected date and database
  void _viewPastHabits() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PastHabitsPage(selectedDate, db!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 227, 243),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Selected Date: ${DateFormat.yMd().format(selectedDate)}"),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: _selectDate,
                        child: Text(
                          "Select Date",
                          style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MonthlySummary(
              datasets: db!.heatMapDataSet,
              startDate: _myBox.get("START_DATE"),
              selectedDate: selectedDate,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db!.todaysHabitList!.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db!.todaysHabitList![index][0],
                  habitCompleted: db!.todaysHabitList![index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                  selectedDate: selectedDate,
                );
              },
            ),
            ElevatedButton(
              onPressed: _viewPastHabits,
              child: Text("View Past Habits"),
            ),
          ],
        ),
      ),
    );
  }
}


// floatingActionButton: FloatingActionButton(
//     child: IconButton(
//         onPressed: () {
//           _showBottomPop(context);
//         },
//         icon: Icon(Icons.add)),
//     onPressed: () {
//       _showBottomPop(context);
//     }),
// backgroundColor: Color.fromARGB(255, 225, 224, 224),
// body: Stack(
//   children: [
//     Positioned(
//       top: 0,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 300,
//         decoration: BoxDecoration(
//           color: Colors.orange,
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//           image: DecorationImage(
//             image: AssetImage('Assets/imagestwo/main4.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//     Positioned(
//       top: 170,
//       left: 20,
//       child: Text(
//         'Hey!',
//         style: TextStyle(
//           fontSize: 35,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     ),
//     Positioned(
//       top: 220,
//       left: 10,
//       child: Text(
//         'You have ${habitList.length} tasks left for today!',
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     ),
//     Positioned(
//       top: 320,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 526,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Keep going!',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                           Text(
//                             "${((counter / habitList.length) * 100).round()}%",
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         child: ClipRRect(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           child: LinearProgressIndicator(
//                             minHeight: 12,
//                             color: Colors.deepPurpleAccent,
//                             backgroundColor:
//                                 Color.fromARGB(255, 192, 170, 250),
//                             value: (counter / habitList.length),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: Divider(),
//                     ),
//                     SizedBox(
//                       child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.zero,
//                         itemCount: habitList.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, int index) {
//                           return ListTile(
//                             title: Text(habitList[index][1]),
//                             subtitle: Text(habitList[index][2]),
//                             trailing: habitList[index][3],
//                             leading: SingleChildScrollView(
//                               child: Checkbox(
//                                 value: habitList[index][0],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     if (value == false) {
//                                       counter -= 1;
//                                     } else {
//                                       counter += 1;
//                                     }
//                                     habitList[index][0] = value!;
//                                   });
//                                 },
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

void _showBottomPop(BuildContext context) {
  showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          height: 300,
          width: 450,
          child: Container(child: TextField()),
        );
      });
}


// padding: const EdgeInsets.fromLTRB(20, 100, 0, 20),