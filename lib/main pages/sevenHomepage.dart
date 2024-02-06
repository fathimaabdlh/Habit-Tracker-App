import 'package:beu_/for%20homepage/habit_database.dart';
import 'package:beu_/main%20pages/homePage.dart';
import 'package:beu_/main%20pages/newprofilepage.dart';
import 'package:beu_/main%20pages/notespage.dart';

import 'package:beu_/main%20pages/past_habits.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late HabitDatabase? db;
  late HabitDatabase? selectedDate;



  @override
  void initState() {
    db = HabitDatabase();
    db!.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Define the createPastHabitsPage function here
    PastHabitsPage createPastHabitsPage() {
      return PastHabitsPage(DateTime.now(), db!);
    }

    // Define the screenBuilders list here
    List<Function> screenBuilders = [
      () => HomePageTwo(),
      ()=>  NoteScreen(),
      // ()=>  NoteScreen(),
      () => PastHabitsPage(DateTime.now(), db!),
    //  createPastHabitsPage,
      () => NewProfilePage()

    ];

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                onPressed: () {
                  _onTabTapped(0);
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                onPressed: () {
                  _onTabTapped(1);
                },
                icon: Icons.description,
                text: 'Notes',
              ),
              GButton(
                onPressed: () {
                  _onTabTapped(2);
                },
                icon: Icons.show_chart,
                text: 'Habits',
              ),
              GButton(
                onPressed: () {
                  _onTabTapped(3);
                },
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _onTabTapped(index);
            },
          ),
        ),
      ),
      body: (screenBuilders[_selectedIndex] as Function)(),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


// class HomePageTwo extends StatelessWidget {
//   const HomePageTwo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('This is the second page'),
//     );
//   }
// }



    //  Scaffold(
    //   backgroundColor: Colors.grey[300],
    //   appBar: AppBar(
    //     backgroundColor: Colors.deepPurple[300],
    //     title: Text('Consistency is key'),
    //   ),
    //   body: Column(
    //     children: [
    //      HabitTile(habitName: '🧘 Meditate',),
    //      HabitTile(habitName: '🏋 Workout'),
    //      HabitTile(habitName: '📖 Read'),
    //      HabitTile(habitName: '🧹 Clean'),
    //      HabitTile(habitName: '📖 Study'),

    //     ],
    //   ),
    // );

