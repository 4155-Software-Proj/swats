// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';

class LookUpInfo extends StatefulWidget {
  const LookUpInfo({Key? key}) : super(key: key);

  @override
  _LookUpInfoState createState() => _LookUpInfoState();
}

class _LookUpInfoState extends State<LookUpInfo> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as List; //Retrieve args sent from last screen
    print(arguments.toString());
    List<int> picData = arguments[0]['signature'].cast<int>();
    //List<int> picData = arguments[0]['signature'].map((s) => s as int).toList();
    Uint8List picture = Uint8List.fromList(picData);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Look Up Order',
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Oswald',
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Customer Name: ' +
                        arguments[0]["customerName"], //Placeholder
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
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Account Number: ' +
                        arguments[0]["customerAccountNumber"], //Placeholder
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
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Bin Location: ' +
                        arguments[0]['binLocation'], //Placeholder
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () {
                    //Navigator.popUntil(context, '/mainMenu');
                  },
                  child: Text('Done'),
                ),
                Container(
                  color: Colors.grey[300],
                  child: Image.memory(picture),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
