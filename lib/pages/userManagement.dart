// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  List<Widget> buildUsers(users) {
    return users
        .map((user) => Card(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(user['firstName'] + " " + user['lastName']),
                      Text(user['userID'])
                    ],
                  )
                ],
              ),
            ))
        .toList();
  }

  var newArgs;
  bool firstRun = true;
  late List<dynamic> arguments;

  @override
  Widget build(BuildContext context) {
    
    if (firstRun) {
      arguments = ModalRoute.of(context)!.settings.arguments as List;
    } else {
      arguments = newArgs;
    } //Retrieve args sent from last screen
    print(arguments.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: arguments
                .map((user) => Card(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['firstName'] + " " + user['lastName'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                user['userID'],
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(user['activated']
                                ? Icons.person
                                : Icons.person_off),
                            onPressed: () async {
                              await DbDriver.changeUserStatus(user['userID']);
                              newArgs = await DbDriver.getUsers();
                              firstRun = false;
                              setState(() {
                                print("NEW ARGS =============" + newArgs.toString());
                                arguments = newArgs;
                              });
                            },
                          ),
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
