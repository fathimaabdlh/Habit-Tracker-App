// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 234, 247, 254),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 234, 247, 254),
//         elevation: 0.0,
//         title: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               // Icon(Icons.arrow_back,color: Colors.black,),
//               Text(
//                 'Sign up',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 28,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Form(
//           key: ,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 70,
//               ),
//               Center(
//                 child: Container(
//                   height: 400,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Color.fromARGB(255, 118, 117, 117),
//                       image: DecorationImage(
//                           image: AssetImage('Assets/imagestwo/happy.png'),
//                           fit: BoxFit.cover)),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         width: 350,
//                         height: 60,
//                         padding: EdgeInsets.only(left: 25),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             suffixIcon: Icon(Icons.person),
//                             hintText: "Enter UserName",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         width: 350,
//                         height: 60,
//                         padding: EdgeInsets.only(left: 25),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             suffixIcon: Icon(Icons.email),
//                             hintText: "Enter Email Id",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         width: 350,
//                         height: 60,
//                         padding: EdgeInsets.only(left: 25),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             suffixIcon: Icon(Icons.remove_red_eye),
//                             hintText: "Enter Password",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 160,
//               ),
//               GestureDetector(
//                 onTap: () {
//                    if (_formKey.currentState!.validate()) {
//             _formKey.currentState!.save();
//             setState(() {
//               _isLoading = true;
//             });
//             // Logging in the user w/ Firebase
//             String result = await AuthMethods()
//           .signUpUser(name: _name, email: _email, password: _password, username: _userName);
//             if (result != 'success') {
//               showSnackBar(result, context);
//             } else {
//               Navigator.pop(context);
//             }
//             setState(() {
//               _isLoading = false;
//             });
//           }
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 260,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.grey,
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   // Lottie.asset('Assets/imagestwo/contbutton.json')
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   rowText() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "  Get a more organised \nlife, and stay disciplined",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//                 wordSpacing: BorderSide.strokeAlignOutside,
//                 letterSpacing: BorderSide.strokeAlignOutside,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "  Make you healthier,happier,and more\n                  productive.",
//               style: TextStyle(
//                   color: Colors.black,
//                   letterSpacing: BorderSide.strokeAlignOutside,
//                   fontSize: 20,
//                   wordSpacing: BorderSide.strokeAlignOutside),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 55,
//         ),
//         Container(
//           height: 300,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Color.fromARGB(255, 118, 117, 117),
//               image: DecorationImage(
//                   image: AssetImage('Assets/imagestwo/happy.png'),
//                   fit: BoxFit.cover)),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 width: 350,
//                 height: 60,
//                 padding: EdgeInsets.only(left: 25),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     suffixIcon: Icon(Icons.email),
//                     hintText: "Enter your Email",
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 55,
//               ),
//               Container(
//                 width: 350,
//                 height: 60,
//                 padding: EdgeInsets.only(left: 25),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     suffixIcon: Icon(Icons.remove_red_eye),
//                     hintText: "Enter your Password",
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 85.0),
//           child: Text(
//             'Dont Remember Your Password ?',
//             style: TextStyle(
//                 color: Color.fromARGB(255, 42, 146, 237),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16),
//           ),
//         ),
//         SizedBox(
//           height: 25,
//         ),
//       ],
//     );
//   }
// }

import 'package:beu_/intro_screen/introOne.dart';
import 'package:beu_/main%20pages/thirdPage.dart';
import 'package:beu_/servicce/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Corrected typo in the import statement

class SignUp extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  String? _userName;
  bool _isLoading = false;

  Future<void> saveLoginStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value);
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      // Logging in the user w/ Firebase
      String result = await AuthMethods().signUpUser(
        name: _name,
        email: _email,
        password: _password,
        username: _userName,
      );

      if (result != 'success') {
        // showSnackBar(result, context);
      } else {
        // Save login status in SharedPreferences
        await saveLoginStatus(true);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IntroOne(),
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 50.0,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (input) => input!.trim().isEmpty
                            ? 'Please enter a valid name'
                            : null,
                        onSaved: (input) => _name = input!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (input) => input!.trim().isEmpty
                            ? 'Please enter a valid username'
                            : null,
                        onSaved: (input) => _userName = input!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input!.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        onSaved: (input) => _email = input!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input!.length < 6
                            ? 'Must be at least 6 characters'
                            : null,
                        onSaved: (input) => _password = input!,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 40,
                      ),
                      child: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: _isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : TextButton(
                                onPressed: () => _signUp(),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ThirdPage()));
                        },
                        child: Text(
                          'Back to Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     // Logging in the user w/ Firebase
  //     String result = await AuthMethods().signUpUser(
  //         name: _name, email: _email, password: _password, username: _userName);
  //     if (result != 'success') {
  //       // showSnackBar(result, context);
  //     } else {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => IntroOne(),
  //           ));
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
}
