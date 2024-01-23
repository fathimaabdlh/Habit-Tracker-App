import 'package:beu_/main%20pages/homePage.dart';
import 'package:beu_/main%20pages/sevenHomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({Key? key}) : super(key: key);

  @override
  _IntroTwoState createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  late String selectedOption;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedOption = '';
    checkShowIntro();
  }

  Future<void> checkShowIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (!showIntro) {
      // If intro has already been seen, navigate to the main content
      // Replace the 'Home' widget with your actual main content widget
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '🌅 Welcome to the sunrise\nHow early do you wake up?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 90),
              buildRadioTile('🌄 Early bird (before 6 AM)'),
              SizedBox(height: 30),
              buildRadioTile('🌅 Morning person (6-8 AM)'),
              SizedBox(height: 30),
              buildRadioTile('😴 Night owl (after 8 AM)'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await markIntroAsComplete();
                  // Navigate to the next intro page or main content page
                  // Replace 'Home()' with your desired destination
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageTwo()));
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioTile(String title) {
    return Container(
      height: 75,
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 254, 216, 252),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: selectedOption,
            onChanged: (value) {
              _handleOptionSelected(value!);
            },
          ),
          Text(title),
          if (selectedOption == title)
            Icon(
              Icons.check,
              size: 35,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  void _handleOptionSelected(String option) {
    print('Selected option: $option');
    setState(() {
      selectedOption = option;
    });
  }

  Future<void> markIntroAsComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showIntro', false);
  }
}


  
  // void setState(Null Function() param0) {}

//     Scaffold(

//       body:ListView(
//         children: [
//            Row(
//                 mainAxisAlignment: MainAxisAlignment.center,

//                 children: [

//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text('Got it! How long do you\nusually need to get up from\nbed?',
//                     style: TextStyle(
//                        color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 28,
//                       wordSpacing: BorderSide.strokeAlignOutside,
//                       // letterSpacing: BorderSide.strokeAlignOutside,
//                     ),),
//                   )
//                 ],
//               ),
//               SizedBox(height: 90,),
//              Column(
//               children: [

//                     _conclass('🕒 0-10 minutes'),
//                     SizedBox(height: 13),
//                     _conclass('🕒 10-20 minutes'),
//                     SizedBox(height: 13),
//                     _conclass('🕒 20-30 minutes'),
//                     SizedBox(height: 13),
//                     _conclass('🕒 More than 30 minutes'),
//               ],
//              )
//         ],
//       ) ,
//      ) ;
//   }

//  Widget _conclass(String text) {
//     return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Container(
//         height: 75,
//         width: 400,
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 254, 216, 252),
//             borderRadius: BorderRadius.circular(20)),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10.0, top: 20),
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//     ]);