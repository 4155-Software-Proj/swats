// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:swats/services/dbDriver.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as List;


    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Main Menu'),
            Text('User: ' + arguments[1] + " " + arguments[2]),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orderCheckInScan');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.get_app, color: Colors.black),
                        Text(
                          'Order Check-In',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orderCheckOutScan');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.upload, color: Colors.black),
                        Text(
                          'Order Checkout',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/lookUpOrder');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.black),
                        Text(
                          'Order Lookup',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: arguments[3][1] ? () async => { Navigator.pushNamed(context, '/reports', arguments: await DbDriver.getOverDueReport())} : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.summarize, color: Colors.black),
                        Text(
                          'Reports',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: arguments[3][1] ? () async => Navigator.pushNamed(context, '/userManagement', arguments: await DbDriver.getUsers()) : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.account_circle, color: Colors.black),
                        Text(
                          'User Mgmt',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.amber,
                    ),
                    onPressed: arguments[3][1] ? () => Navigator.pushNamed(context, '/customerManagement') : null,
                    
                    // () {
                    //   List<bool> test = arguments[3] as List<bool>;
                    //   print(arguments[3]);
                    // },

                    // 
                    // () {

                    //   Navigator.pushNamed(context, '/customerManagement');
                    // },
                    // userLevel[1] ? null : () => Navigator.pushNamed(context, '/customerManagement');
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.manage_accounts, color: Colors.black),
                        Text(
                          'Customer Mgmt',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     fixedSize: const Size(100, 100),
                  //     primary: Colors.amber,
                  //   ),
                  //   onPressed: () {},
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Icon(Icons.text_snippet, color: Colors.black),
                  //       Text(
                  //         'Test !!!!',
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
