// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OrderCheckInScan extends StatefulWidget {
  const OrderCheckInScan({Key? key}) : super(key: key);

  @override
  _OrderCheckInScanState createState() => _OrderCheckInScanState();
}

class _OrderCheckInScanState extends State<OrderCheckInScan> {
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }

  List<String> documents = [];
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-In Scan'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: fieldText,
              autofocus: true,
              onSubmitted: (String value) {
                setState(() {
                  result = value;
                  print(result);
                  documents.add(result);
                });
                clearText();
                FocusScope.of(context).previousFocus();
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.black),
                ),
                labelText: 'Document #',
                // fillColor: Colors.grey[400],
                // filled: true,
                focusColor: Colors.black,
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView( 
                shrinkWrap: true,
                children: documents.map((document) => Text(document, textAlign: TextAlign.center, style: TextStyle(letterSpacing: 2.0, fontSize: 20),)).toList(),
              ),
            ),
            // SingleChildScrollView(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black),
            //     ),
            //     child: Column(
            //       children:
            //           documents.map((document) => Text(document)).toList(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
