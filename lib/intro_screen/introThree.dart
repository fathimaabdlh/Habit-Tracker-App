import 'package:beu_/main%20pages/homePage.dart';
import 'package:beu_/main%20pages/sevenHomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroThree extends StatefulWidget {
  IntroThree({Key? key}) : super(key: key);

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  final _formKey = GlobalKey<FormState>();

  // Store the selected option
  String selectedOption = '';

  @override
  void initState() {
    super.initState();
    checkShowIntro();
  }

  Future<void> checkShowIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (!showIntro) {
      // If intro has already been seen, navigate to the main content
      // Replace the 'Home()' widget with your actual main content widget
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  // Function to handle option selection
  void _handleOptionSelected(String option) {
    print('Selected option: $option');
    setState(() {
      selectedOption = option;
    });
  }

  @override
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
                  'How do you feel your energy\nduring the day',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 90),
              buildRadioTile('🌻   High-full of energy during\n       the day'),
              SizedBox(height: 30),
              buildRadioTile('🌾    Meduim-My energy\n         weakens over time'),
              SizedBox(height: 30),
              buildRadioTile('🥀    Low-i need help increasing\n        my energy'),
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
}

//      Scaffold(
//       body:ListView(
//         children: [
//            Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
                
//                 children: [
           
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text('How do you feel your energy\nduring the day',
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
               
//                     _conclass('🌻   High-full of energy during\n       the day'),
//                     SizedBox(height: 22),
//                     _conclass('🌾    Meduim-My energy\n         weakens over time'),
//                     SizedBox(height: 22),
//                     _conclass('🥀    Low-i need help increasing\n        my energy '),
//                     SizedBox(height: 22),
                   
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
//              color: Color.fromARGB(255, 254, 216, 252),
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

    
//   }