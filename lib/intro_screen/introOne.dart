import 'package:beu_/main%20pages/homePage.dart';
import 'package:beu_/main%20pages/sevenHomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroOne extends StatefulWidget {
  IntroOne({Key? key}) : super(key: key);

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
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
                  '👋Hi, tell us about you, how\nlong do you usually sleep at\nnight?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 90),
              buildRadioTile('🥱 Less than 6 hour'),
              SizedBox(height: 30),
              buildRadioTile('🌝 6-8 hours'),
              SizedBox(height: 30),
              buildRadioTile('😁 8-10 hours'),
              SizedBox(height: 30),
              buildRadioTile('😁 10 or more hours'),
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
}

  //   Scaffold(
  //     body: ListView(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // SizedBox(height: 80,),
  //             Padding(
  //               padding: const EdgeInsets.all(20.0),
  //               child: Text(
  //                 '👋Hi,tell us about you,how\nlong do you usually sleep at\n                 night?',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 28,
  //                   wordSpacing: BorderSide.strokeAlignOutside,
  //                   // letterSpacing: BorderSide.strokeAlignOutside,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 90,
  //         ),
  //         Column(
  //           children: [
  //             _conclass(
  //               '🥱 Less than 6 hour',
  //             ),
  //             SizedBox(height: 13),
  //             _conclass2('🌝 6-8 hours'),
  //             SizedBox(height: 13),
  //             _conclass3('😁 8-10 hours'),
  //             SizedBox(height: 13),
  //             _conclass4('😁 8-10 hours'),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _conclass(String text) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     InkWell(
  //       onTap: () {
  //         setState(() {
  //           a = !a;
  //         });
  //       },
  //       child: Container(
  //         height: 75,
  //         width: 400,
  //         decoration: BoxDecoration(
  //             // ignore: dead_code
  //             color: a ? Color.fromARGB(255, 254, 216, 252) : Colors.amber,
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10.0, top: 20),
  //           child: Text(
  //             text,
  //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Widget _conclass2(String text) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     InkWell(
  //       onTap: () {
  //         setState(() {
  //           b = !b;
  //         });
  //       },
  //       child: Container(
  //         height: 75,
  //         width: 400,
  //         decoration: BoxDecoration(
  //             // ignore: dead_code
  //             color: b ? Color.fromARGB(255, 254, 216, 252) : Colors.amber,
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10.0, top: 20),
  //           child: Text(
  //             text,
  //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Widget _conclass3(String text) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     InkWell(
  //       onTap: (){
  //         setState(() {
  //           c=!c;
  //         });
  //       },
  //       child: Container(
  //         height: 75,
  //         width: 400,
  //         decoration: BoxDecoration(
  //             // ignore: dead_code
  //             color: c? Color.fromARGB(255, 254, 216, 252) : Colors.amber,
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10.0, top: 20),
  //           child: Text(
  //             text,
  //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Widget _conclass4(String text) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     InkWell(
  //       onTap: (){
  //         setState(() {
  //           d=!d;
  //         });
  //       },
  //       child: Container(
  //         height: 75,
  //         width: 400,
  //         decoration: BoxDecoration(
  //             // ignore: dead_code
  //             color: d ? Color.fromARGB(255, 254, 216, 252) : Colors.amber,
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10.0, top: 20),
  //           child: Text(
  //             text,
  //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

