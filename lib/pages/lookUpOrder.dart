// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LookUpOrder extends StatefulWidget {
  const LookUpOrder({Key? key}) : super(key: key);

  @override
  _LookUpOrderState createState() => _LookUpOrderState();
}

class _LookUpOrderState extends State<LookUpOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Look Up Order',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
    );
  }
}
