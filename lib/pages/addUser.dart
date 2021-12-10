// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

final first = TextEditingController();
final last = TextEditingController();
final account = TextEditingController();

class _AddUserState extends State<AddUser> {
  bool perms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: first,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                labelText: 'First Name',
                // fillColor: Colors.grey[400],
                // filled: true,
                focusColor: Colors.amber,
                floatingLabelStyle: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: last,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                labelText: 'Last Name',
                // fillColor: Colors.grey[400],
                // filled: true,
                focusColor: Colors.amber,
                floatingLabelStyle: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: account,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                labelText: 'User ID',
                // fillColor: Colors.grey[400],
                // filled: true,
                focusColor: Colors.amber,
                floatingLabelStyle: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                labelStyle: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Admin: ",
                    style: TextStyle(color: Colors.amber, fontSize: 20)),
                Theme(
                  child: Checkbox(
                    tristate: false,
                    value: perms,
                    onChanged: (value) {
                      setState(() {
                        perms = value!;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          
          DbDriver.addUser(first.text, last.text, account.text, perms);
          print(perms);
          first.clear();
          last.clear();
          account.clear();
          perms = false;
          Navigator.popUntil(context, ModalRoute.withName("/mainMenu"));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
