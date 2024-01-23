import 'package:flutter/material.dart';

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
    _editedPhoneNumber = '1234567890'; // Replace with actual user's phone number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$_editedName',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${widget.userEmail}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.indigo),
                title: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '$_editedPhoneNumber',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: _editPhoneNumber,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editName,
              child: Text('Update Name'),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _editPhoneNumber() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Phone Number'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'New Phone Number',
              border: OutlineInputBorder(),
            ),
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
                // Save updated phone number or perform other actions
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'New Name',
              border: OutlineInputBorder(),
            ),
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
                // Save updated name or perform other actions
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
