// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class LookUpOrder extends StatefulWidget {
  const LookUpOrder({Key? key}) : super(key: key);

  @override
  _LookUpOrderState createState() => _LookUpOrderState();
}

class _LookUpOrderState extends State<LookUpOrder> {
  final docField = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: docField,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Barcode Scan',
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
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () async {
                    var order =
                        await DbDriver.getOrdersByDocument(docField.text);

                    var customer = await DbDriver.getCustomerByAccountNumber(
                        order[0]["customerAccountNumber"]);

                    order[0]["customerName"] = customer[0]["customerName"];
                    print(order.toString());
                    Navigator.pushReplacementNamed(context, '/lookUpInfo',
                        arguments: order);
                  },
                  child: Text('Look Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
