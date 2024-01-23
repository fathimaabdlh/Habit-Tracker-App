import 'package:beu_/main%20pages/fifthPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyForm extends StatefulWidget {
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final _formKey = GlobalKey<FormState>();
  String selectedOption = '';

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
                  'Do you often procrastinate?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 90),
              buildRadioTile('✌️ I easily keep up with my schedule'),
              SizedBox(height: 30),
              buildRadioTile('📅 I procrastinate from time to time'),
              SizedBox(height: 30),
              buildRadioTile('✊ Yes, and I want to change it!!'),
              SizedBox(height: 130),
              Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Store survey completion status in SharedPreferences
                      saveSurveyCompletionStatus();

                      // Submit the form data
                      // You can send the data to your server or process it as needed
                      // For now, just print the data
                      print('Selected option: $selectedOption');

                      // Navigate to the next page
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return FifthPage();
                      }));
                    }
                  },
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
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
              setState(() {
                selectedOption = value!;
              });
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

  Future<void> saveSurveyCompletionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('surveyCompleted', true);
  }
}





// import 'package:flutter/material.dart';

// class IntroSixth extends StatefulWidget {
//   const IntroSixth({super.key});

//   @override
//   State<IntroSixth> createState() => _IntroSixthState();
// }

// class _IntroSixthState extends State<IntroSixth> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 70,),
//             Text('  Do you often procrastinate?',style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 30
//             ),),
//             containerWidget()
//           ],
//         ),
//       ),
//     );
//   }
// containerWidget(){
//   return Column(
//     children: [
      
//     ],
//   )
// }



  
// }