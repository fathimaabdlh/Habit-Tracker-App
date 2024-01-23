// import 'package:beu_/main%20pages/firstPage.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
//         children: [
//           CircleAvatar(
//             radius: 150,
//             backgroundColor: const Color.fromARGB(255, 235, 155, 249),
//             child: Image.asset('Assets/imagestwo/pr2.png'),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 25, bottom: 20),
//             child: Center(
//               child: Text(
//                 'Hey!',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Center(
//             child: Text(
//               'What a wonderful day!',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('My Account Info'),
//             trailing: Icon(Icons.arrow_forward_ios),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.payment),
//             title: Text('My Subscription Info'),
//             trailing: Icon(Icons.arrow_forward_ios),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.list),
//             title: Text('All of my habits'),
//             trailing: Icon(Icons.arrow_forward_ios),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.info),
//             title: Text('About this app'),
//             trailing: Icon(Icons.arrow_forward_ios),
//           ),
//           Divider(),
//           TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return FirstPage();
//                 }));
//                 print('User logged out');
//               },
//               child: Text(
//                 'Log Out',
//                 style:
//                     TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//               ))
//         ],
//       ),
//     );
//   }
// }
