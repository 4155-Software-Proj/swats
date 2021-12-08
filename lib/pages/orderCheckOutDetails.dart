// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';
import 'package:signature/signature.dart';

class OrderCheckOutDetails extends StatefulWidget {
  const OrderCheckOutDetails({Key? key}) : super(key: key);

  @override
  _OrderCheckOutDetailsState createState() => _OrderCheckOutDetailsState();
}

class _OrderCheckOutDetailsState extends State<OrderCheckOutDetails> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print("Draw Started!"),
    onDrawEnd: () => print("Draw ended!"),
  );

  bool checkedValue = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print('Value Changed!');
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as List; //Retrieve args sent from last screen
    List<int>? sig;
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-out Details'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: <Widget>[
          Text("Customer Name: " + arguments[0]['customerName']),
          Text("Customer Account Number: " +
              arguments[0]['customerAccountNumber']),
          Text("Bin Location: " + arguments[0]["binLocation"]),
          Text("Documents on order: " + arguments[0]["documents"].toString()),
          CheckboxListTile(
            value: checkedValue,
            onChanged: (value) {
              setState(() {
                checkedValue = value!;
              });
            },
            title: Text("Checked Out: "),
          ),
          SizedBox(height: 50),
          //SIGNATURE CANVAS
          Signature(
            controller: _controller,
            height: 350,
            backgroundColor: Colors.grey,
          ),
          //OK AND CLEAR BUTTONS
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //SHOW EXPORTED IMAGE IN NEW ROUTE
                TextButton(
                  child: Text('Save Signature'),
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      final Uint8List? data = await _controller.toPngBytes();
                      if (data != null) {
                        print(data);
                        sig = data;
                      }
                    }
                  },
                ),
                //CLEAR CANVAS
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                DbDriver.updateOrderCheckout(arguments[0]["orderID"], sig!);
                Navigator.popUntil(
                    context,  ModalRoute.withName('/mainMenu'));
              },
              child: Text("Confirm Checkout")),
        ],
      ),
    );
  }
}
