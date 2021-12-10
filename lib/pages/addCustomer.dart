// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final nameController = TextEditingController();
  final accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Customer'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onSubmitted: (value) async {},
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                labelText: 'Customer Name',
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
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: accountController,
              onSubmitted: (value) async {},
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber),
                ),
                labelText: 'Customer Account Number',
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
            SizedBox(height: 30),
            SizedBox(
              width: 500,
              height: 50,
              child: TextButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String account = nameController.text;
                    DbDriver.insertCustomer(
                        name, account);

                    Navigator.popUntil(
                        context, ModalRoute.withName("/mainMenu"));
                  },
                  child: Text("Create", style: TextStyle(fontSize: 30)),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green, primary: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
