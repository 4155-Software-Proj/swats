// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class CustomerManagement extends StatefulWidget {
  const CustomerManagement({Key? key}) : super(key: key);

  @override
  _CustomerManagementState createState() => _CustomerManagementState();
}

class _CustomerManagementState extends State<CustomerManagement> {
  late Future<List<Map<String, dynamic>>>? _customers;
  @override
  Future<List<Map<String, dynamic>>> getCustomers() async {
    dynamic testVar = await DbDriver.getCustomers();
    print(testVar);
    return testVar;
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    _customers = getCustomers();
  }

  List<Widget> _buildCardList(List<Map<String, dynamic>>? data) {
    return data!
        .map(
          (customer) => Card(
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          customer['customerName'],
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          customer['customerAccountNumber'],
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      DbDriver.deleteCustomer(
                          customer['customerAccountNumber']);

                      // _customers = await getCustomers();

                      Navigator.pushReplacementNamed(
                          context, '/customerManagement');
                    },
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Management'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _customers,
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = _buildCardList(snapshot.data);
                print(snapshot.data);
                print(_customers.toString());
                // snapshot.data!
                //     .map(
                //       (customer) => Card(
                //         child: Container(
                //           height: 100,
                //           child: Row(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       customer['customerName'],
                //                       textAlign: TextAlign.start,
                //                       style: TextStyle(fontSize: 15),
                //                     ),
                //                     Text(
                //                       customer['customerAccountNumber'],
                //                       textAlign: TextAlign.start,
                //                       style: TextStyle(fontSize: 15),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Spacer(),
                //               IconButton(
                //                 icon: Icon(Icons.edit),
                //                 onPressed: () {},
                //               ),
                //               SizedBox(width: 10),
                //               IconButton(
                //                 icon: Icon(Icons.delete),
                //                 onPressed: () {
                //                   DbDriver.setState(() {});
                //                 },
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //     .toList();
                //<Widget>[
                //   Card(
                //     child: Column(
                //       //children: [Text(snapshot.data.toString())],
                //       children: snapshot.data!
                //     .map((customer) => Text(
                //           customer['customerName'],
                //           textAlign: TextAlign.center,
                //           style: TextStyle(letterSpacing: 2.0, fontSize: 20),
                //         ))
                //     .toList(),
                //     ),
                //   )
                // ];
              } else {
                children = <Widget>[Text("Waiting for Data")];
              }
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
