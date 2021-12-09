import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swats/services/dbDriver.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

final DateFormat formatter = DateFormat('MMM-dd-yyyy');

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as List;
    // print(arguments);
    // arguments.add({"test": "Test"});
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: arguments.isEmpty
                ? <Widget>[Center(child: const Text("No Report To Generate"))]
                : arguments
                    .map((order) => Center(
                          child: Card(
                            child: Column(
                              children: [
                                Text("Account Number: " +
                                    order['customerAccountNumber']),
                                Text("Bin Location: " + order['binLocation']),
                                Text("Bin Date: " +
                                    formatter.format(order['dateCreated'])),
                                Text(order['orderID'])
                                //SingleChildScrollView(child: Column(children: order['documents'].map((doc) => Text(doc.toString())).toList(),),)
                              ],
                            ),
                          ),
                        ))
                    .toList()),
      ),
    );
  }
}
