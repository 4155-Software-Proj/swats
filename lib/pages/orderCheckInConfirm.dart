// ignore_for_file: file_names

import 'package:flutter/material.dart';
import "package:flutter_typeahead/flutter_typeahead.dart";
import "package:swats/services/dbDriver.dart";

class OrderCheckInConfirm extends StatefulWidget {
  const OrderCheckInConfirm({Key? key}) : super(key: key);

  @override
  _OrderCheckInConfirmState createState() => _OrderCheckInConfirmState();
}

class _OrderCheckInConfirmState extends State<OrderCheckInConfirm> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as List; //Retrieve args sent from last screen
    print(arguments[0]);

    List<String> documents = arguments[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Check-in' + " " + arguments[2]),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Customer: " + arguments[1]),
            SizedBox(height: 20),
            Text("Customer Account: " + arguments[2]),
            SizedBox(height: 20),
            Text("Bin Location: " + arguments[3]),
            SizedBox(height: 20),
            Text("Documents"),
            Divider(),
            SizedBox(height: 20),
            Expanded(
              flex: 10,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: documents
                    .map((document) => Text(
                          document,
                          textAlign: TextAlign.center,
                          style: TextStyle(letterSpacing: 2.0, fontSize: 20),
                        ))
                    .toList(),
              ),
            ),
            Spacer(),
            ButtonTheme(
              height: 200,
              minWidth: 800,
              child: TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: Size(300, 100),
                      side: BorderSide(width: 1.0, color: Colors.green),
                      primary: Colors.green),
                  onPressed: () {
                    DbDriver.insertOrder(documents, arguments[2], arguments[3]);
                    Navigator.popUntil(
                        context, ModalRoute.withName("/mainMenu"));
                  },
                  child: Text("Confirm Order Stow")),
            ),
          ],
        ),
      ),
    );
  }
}
