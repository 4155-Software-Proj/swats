// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class OrderCheckOutScan extends StatefulWidget {
  const OrderCheckOutScan({Key? key}) : super(key: key);

  @override
  _OrderCheckOutScanState createState() => _OrderCheckOutScanState();
}

class _OrderCheckOutScanState extends State<OrderCheckOutScan> {
  final scanField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-out Scan'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: scanField,
                    autofocus: true,
                    onSubmitted: (String value) async {
                      var order = await DbDriver.getOrdersByDocument(value);
                      print(order);
                      var customer = await DbDriver.getCustomerByAccountNumber(
                          order[0]["customerAccountNumber"]);
                      order[0]["customerName"] = customer[0]["customerName"];
                      Navigator.pushNamed(context, '/orderCheckOutDetails',
                          arguments: order);
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
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
                  )
                ],
              ),
            ),
          )),
    );
  }
}
