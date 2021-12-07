// ignore_for_file: file_names

import 'package:flutter/material.dart';
import "package:flutter_typeahead/flutter_typeahead.dart";
import "package:swats/services/dbDriver.dart";

class OrderCheckInDetails extends StatefulWidget {
  const OrderCheckInDetails({Key? key}) : super(key: key);

  @override
  _OrderCheckInDetailsState createState() => _OrderCheckInDetailsState();
}

class _OrderCheckInDetailsState extends State<OrderCheckInDetails> {
  @override
  Widget build(BuildContext context) {
    var customerNameController = TextEditingController();
    var customerAccountController = TextEditingController();
    var binLocationController = TextEditingController();
    final arguments = ModalRoute.of(context)!.settings.arguments
        as List; //Retrieve args sent from last screen
    dynamic condensedArgs = [arguments];
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-In Details'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: customerNameController,
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
                suggestionsCallback: (pattern) async {
                  return await DbDriver.getCustomersAccountAndNamePartial(
                      pattern);
                },
                itemBuilder: (context, dynamic suggestion) {
                  return ListTile(
                    title: Text(suggestion["customerName"]),
                    subtitle: Text(suggestion["customerAccountNumber"]),
                  );
                },
                onSuggestionSelected: (dynamic suggestion) {
                  customerNameController.text = suggestion["customerName"];
                  customerAccountController.text =
                      suggestion["customerAccountNumber"];
                },
              ),
              // const TextField(
              //   style: TextStyle(color: Colors.black),
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 2.0, color: Colors.amber),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 2.0, color: Colors.amber),
              //     ),
              //     labelText: 'Customer Name',
              //     // fillColor: Colors.grey[400],
              //     // filled: true,
              //     focusColor: Colors.amber,
              //     floatingLabelStyle: TextStyle(
              //       color: Colors.amber,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // const TextField(
              //   style: TextStyle(color: Colors.black),
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 2.0, color: Colors.amber),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 2.0, color: Colors.amber),
              //     ),
              //     labelText: 'Customer Account Number',
              //     // fillColor: Colors.grey[400],
              //     // filled: true,
              //     focusColor: Colors.amber,
              //     floatingLabelStyle: TextStyle(
              //       color: Colors.amber,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   ),
              // ),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: customerAccountController,
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
                suggestionsCallback: (pattern) async {
                  return await DbDriver.getCustomersAccountAndNamePartial(
                      pattern);
                },
                itemBuilder: (context, dynamic suggestion) {
                  return ListTile(
                    title: Text(suggestion["customerName"]),
                    subtitle: Text(suggestion["customerAccountNumber"]),
                  );
                },
                onSuggestionSelected: (dynamic suggestion) {
                  customerNameController.text = suggestion["customerName"];
                  customerAccountController.text =
                      suggestion["customerAccountNumber"];
                },
              ),
              SizedBox(
                height: 20,
              ),
               TextField(
                controller: binLocationController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.amber),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.amber),
                  ),
                  labelText: 'Bin Location',
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // condensedArgs.add(customerNameController.text);
          // condensedArgs.add(customerAccountController.text);
          Navigator.pushNamed(context, '/orderCheckInConfirm', arguments: [arguments, customerNameController.text, customerAccountController.text, binLocationController.text]); //TODO: Pass all checkin data to final screen
        },
        backgroundColor: Colors.green[700],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward_ios, size: 15),
            Text('Next'),
          ],
        ),
      ),
    );
  }
}
