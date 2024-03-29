import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:beu_/for%20homepage/habit_database.dart';

// Extension for DateTime to check if two dates are the same
extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }
}

// Create a DateTime object from a string in the format yyyymmdd
DateTime createDateTimeObject(String yyyymmdd) {
  if (yyyymmdd.length != 8) {
    
    return DateTime.now(); // Return current date if the format is incorrect
  }

  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  return DateTime(yyyy, mm, dd);
}

class PastHabitsPage extends StatelessWidget {
  final DateTime? selectedDate;
  final HabitDatabase? db;

  PastHabitsPage(this.selectedDate, this.db);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Past Habits - ${DateFormat.yMd().format(selectedDate!)}"),
      ),
      body: ListView.builder(
        itemCount: db?.todaysHabitList?.length ?? 0,
        itemBuilder: (context, index) {
          if (db?.todaysHabitList != null &&
              index >= 0 &&
              index < db!.todaysHabitList!.length) {
            var habitEntry = db!.todaysHabitList![index];
            if (habitEntry != null && habitEntry.length >= 3) {
              String habitName = habitEntry[0].toString() ?? "Unknown Habit";
              var isCompleted = habitEntry[2] ?? false;

              String habitDateStr = habitEntry[0] ?? "";
              DateTime habitDate = createDateTimeObject(habitDateStr);

              var habitOnSelectedDate = habitDate.isSameDate(selectedDate ?? DateTime.now());

              if (habitOnSelectedDate) {
                return ListTile(
                  subtitle: Text("Completed: $isCompleted"),
                );
              }
            }
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}





// import 'package:beu_/for%20homepage/habit_database.dart';
// import 'package:flutter/material.dart';

// class PastHabitsPage extends StatelessWidget {
//   final DateTime? selectedDate;
//   final HabitDatabase? db;
  

//   // Constructor to receive required parameters
//   PastHabitsPage(this.selectedDate, this.db);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Past Habits - ${selectedDate?.toLocal()}"),
//       ),
//       body: ListView.builder(
//         itemCount: db?.todaysHabitList?.length ?? 0,
//         itemBuilder: (context, index) {
//           //print(db?.todaysHabitList?[index][0].isSameDate(selectedDate));
//           //  return Text('kkk');
//           String habitName = db?.todaysHabitList?[index][0] ?? "fathiiiii";
//           bool isCompleted = db?.todaysHabitList?[index][1] ?? false;



//           // Assuming `isSameDate` is a method to compare if the habit date matches the selected date
//           // bool habitOnSelectedDate =
//           //     db?.todaysHabitList?[index][0].isSameDate(selectedDate);
//           bool habitOnSelectedDate = db?.todaysHabitList?[index][0].isSameDate(selectedDate);

          

       
//           if (habitOnSelectedDate) {
//             return ListTile(
//               title: Text(habitName),
//               subtitle: Text("Completed: $isCompleted"),
//             );
            
//           } else {
//             return SizedBox
//                 .shrink(); // Return an empty widget for habits not on the selected date
//           }
//         },
//       ),
//     );
//   }
// }





















//       backgroundColor: Colors.grey.shade100,
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Stack(
//               children: [
//                 Container(
//               width: MediaQuery.of(context).size.width,
//               height: 300,
//               decoration: BoxDecoration(
//                 color: Colors.orange,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//                 image: DecorationImage(
//                   image: AssetImage('Assets/imagestwo/progress.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//                 Positioned(
//                   top: 166,
//                   left: 30,
//                   child: Text('Hey!',style: TextStyle(
                              
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
                              
//                   ),),
//                 ),
//                 Positioned(
//                   top: 220,
//                   left: 20,
//                   child: Text( 'Keep going champ',
//                               style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                               ),),
//                 )
//               ],
//             ),
//           ),
//           Padding(padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
//           child:Text('Top Habits this week',style: TextStyle(
//             color: Colors.grey.shade700,
//             fontSize: 22,
//             fontWeight: FontWeight.w500
//           ),) ,),
//               SizedBox(height: 20,),
//            Container(
//             width: MediaQuery.of(context).size.width*0.9,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.white
//             ),
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 1,
//                   )),
//                   title: Text('Drinking water',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How good you have been at drinking water this week'),
//                   trailing: Icon(Icons.water),
//                 ),
//                 Divider(),
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 1,
//                   )),
//                   title: Text('Reading',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How good you have been at reading this week'),
//                   trailing: Icon(Icons.book),
//                 ),
//                   Divider(),
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 0.5,
//                   )),
//                   title: Text('Exercising',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How good you have been at exercising this week'),
//                   trailing: Icon(Icons.sports_gymnastics),
//                 ),
                

//               ],
//             ),
//           ),
//             Padding(padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
//           child:Text('Worst Habits this week',style: TextStyle(
//             color: Colors.grey.shade700,
//             fontSize: 22,
//             fontWeight: FontWeight.w500
//           ),) ,),
//               SizedBox(height: 20,),
//            Container(
//             width: MediaQuery.of(context).size.width*0.9,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.white
//             ),
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 1,
//                   )),
//                   title: Text('Coding',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How bad you have been at coding  this week'),
//                   trailing: Icon(Icons.computer),
//                 ),
//                 Divider(),
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 1,
//                   )),
//                   title: Text('Journaling',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How bad you have been at journaling this week'),
//                   trailing: Icon(Icons.book),
//                 ),
//                   Divider(),
//                 ListTile(
//                   leading: Title(color: Colors.black, child:CircularProgressIndicator(
//                     color: Colors.deepPurpleAccent,
//                     strokeWidth: 7.5,
//                     backgroundColor: Color.fromARGB(255, 192, 170, 250),
//                     value: 0.5,
//                   )),
//                   title: Text('Learning Language',style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),) ,
//                   subtitle: Text('How bad you have been at learning language this week'),
//                   trailing: Icon(Icons.language),
//                 ),
                

//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// }
