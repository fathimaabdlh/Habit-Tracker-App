import 'package:beu_/for%20prof/about.dart';
import 'package:beu_/for%20prof/logout.dart';
import 'package:beu_/main%20pages/firstPage.dart';
import 'package:beu_/servicce/auth.service.dart';
import 'package:beu_/servicce/signOut.dart';
import 'package:beu_/signUp.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beu_/model/authStatus.dart';

class UserData {
  static const String boxName = 'user_data';
  static const String keyName = 'user_name';

  static Future<void> setUserName(String name) async {
    var box = await Hive.openBox(boxName);
    await box.put(keyName, name);
  }

  static Future<String?> getUserName() async {
    var box = await Hive.openBox(boxName);
    return box.get(keyName);
  }
}

class NewProfilePage extends StatefulWidget {
  NewProfilePage({Key? key}) : super(key: key);

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  late String _userName = ''; // Initialize with an empty string

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String? storedName = await UserData.getUserName();
    setState(() {
      _userName = storedName ?? 'Default User';
    });
  }

  @override
  Widget build(BuildContext context) {
    void logOut() {
      final _auth = AuthMethods();
      _auth.signOut();
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
        children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: const Color.fromARGB(255, 235, 155, 249),
            child: Image.asset('Assets/imagestwo/pr2.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 20),
            child: Center(
              child: Text(
                'Hey, $_userName!', // Display the user's name
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'What a wonderful day!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About this app'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Account'),
            subtitle: Text('View and edit your account information'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountDetailsPage(
                    userName: _userName,
                    userEmail:
                        'user@example.com', // Replace with the actual user email
                  ),
                ),
              );
            },
          ),
          Divider(),
          SizedBox(
            height: 80,
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return SignUp();
              }));
              // logOut();
            },
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class AccountDetailsPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  AccountDetailsPage({required this.userName, required this.userEmail});

  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  late String _editedName;
  late String _editedPhoneNumber;

  @override
  void initState() {
    super.initState();
    _editedName = widget.userName;
    _editedPhoneNumber =
        '1234567890'; // Replace with actual user's phone number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $_editedName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Email: ${widget.userEmail}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number: $_editedPhoneNumber'),
              subtitle: Text('Tap to edit'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Edit Phone Number'),
                      content: TextField(
                        decoration:
                            InputDecoration(labelText: 'New Phone Number'),
                        onChanged: (value) {
                          setState(() {
                            _editedPhoneNumber = value;
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);

                            // Save updated name to Hive
                            await UserData.setUserName(_editedName);

                            // Reload the user name from Hive
                            String? storedName = await UserData.getUserName();
                            setState(() {
                              _editedName = storedName ?? _editedName;
                            });
                          },
                          child: Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Edit Name'),
                      content: TextField(
                        decoration: InputDecoration(labelText: 'New Name'),
                        onChanged: (value) {
                          setState(() {
                            _editedName = value;
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);

                            // Save updated name to Hive
                            await UserData.setUserName(_editedName);

                            // Reload the user name from Hive
                            String? storedName = await UserData.getUserName();
                            setState(() {
                              _editedName = storedName ?? _editedName;
                            });
                          },
                          child: Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Update Account'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
