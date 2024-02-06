import 'package:beu_/main pages/fourthPage.dart';
import 'package:beu_/intro_screen/introOne.dart';
import 'package:beu_/model/forgot.dart';
import 'package:beu_/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> saveLoginStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value);
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        isLoading = false;
      });

      // Save login status in SharedPreferences
      await saveLoginStatus(true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FourthPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that Email')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Wrong password provided for that user")),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoggedInStatus();
  }

  Future<void> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FourthPage()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 247, 254),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  Get a more organised \nlife, and stay disciplined",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          wordSpacing: BorderSide.strokeAlignOutside,
                          letterSpacing: BorderSide.strokeAlignOutside,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  Make you healthier, happier, and more\n                  productive.",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: BorderSide.strokeAlignOutside,
                            fontSize: 20,
                            wordSpacing: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 55),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 118, 117, 117),
                      image: DecorationImage(
                        image: AssetImage('Assets/imagestwo/happy.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Container(
                            width: 350,
                            height: 60,
                            padding: EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Some Text';
                                }
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.email),
                                hintText: "Enter your Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 55),
                          Container(
                            width: 350,
                            height: 60,
                            padding: EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Your Password';
                                }
                              },

                              
                              obscureText: true,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.remove_red_eye),
                                hintText: "Enter your Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 85.0),
                      child: Text(
                        'Dont Remember Your Password ?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 146, 237),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
              SizedBox(height: 200),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      const Color.fromARGB(255, 72, 167, 245),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await signInWithEmailAndPassword();
                    }
                  },
                  child: Center(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  // rowText() {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "  Get a more organised \nlife, and stay disciplined",
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.bold,
  //               fontSize: 30,
  //               wordSpacing: BorderSide.strokeAlignOutside,
  //               letterSpacing: BorderSide.strokeAlignOutside,
  //             ),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "  Make you healthier,happier,and more\n                  productive.",
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 letterSpacing: BorderSide.strokeAlignOutside,
  //                 fontSize: 20,
  //                 wordSpacing: BorderSide.strokeAlignOutside),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 55,
  //       ),
  //       Container(
  //         height: 300,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Color.fromARGB(255, 118, 117, 117),
  //             image: DecorationImage(
  //                 image: AssetImage('Assets/imagestwo/happy.png'),
  //                 fit: BoxFit.cover)),
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 50,
  //             ),
  //             Container(
  //               width: 350,
  //               height: 60,
  //               padding: EdgeInsets.only(left: 25),
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[200],
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //               child: TextField(
  //                 // controller: _emailController,
  //                 decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   suffixIcon: Icon(Icons.email),
  //                   hintText: "Enter your Email",
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey,
  //                     fontSize: 15,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 55,
  //             ),
  //             Container(
  //               width: 350,
  //               height: 60,
  //               padding: EdgeInsets.only(left: 25),
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[200],
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //               child: TextField(
  //                 decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   suffixIcon: Icon(Icons.remove_red_eye),
  //                   hintText: "Enter your Password",
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey,
  //                     fontSize: 15,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: 5,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(right: 85.0),
  //         child: Text(
  //           'Dont Remember Your Password ?',
  //           style: TextStyle(
  //               color: Color.fromARGB(255, 42, 146, 237),
  //               fontWeight: FontWeight.bold,
  //               fontSize: 16),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 25,
  //       ),
  //     ],
  //   );
  // }


  // continueButton() {
  //   return Container(
  //     height: 60,
  //     child: GestureDetector(
  //       onTap: () {
  //         Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => const FourthPage(),
  //         ));
  //       },
  //       child: Center(
  //         child: Text(
  //           'Continue',
  //           style: TextStyle(
  //               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  //         ),
  //       ),
  //     ),
  //     decoration: BoxDecoration(
  //         color: Colors.black,
  //         borderRadius: BorderRadius.circular(30),
  //         boxShadow: isButtonPressed
  //             ? []
  //             : [
  //                 BoxShadow(
  //                     color: Colors.grey.shade500,
  //                     offset: Offset(6, 6),
  //                     blurRadius: 5,
  //                     spreadRadius: 1),
  //                 BoxShadow(
  //                     color: Colors.white,
  //                     offset: Offset(-6, -6),
  //                     blurRadius: 15,
  //                     spreadRadius: 1)
  //               ]),
  //   );
  // }
