// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LookUpInfo extends StatefulWidget {
  const LookUpInfo({Key? key}) : super(key: key);

  @override
  _LookUpInfoState createState() => _LookUpInfoState();
}

class _LookUpInfoState extends State<LookUpInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Summary',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
    );
  }
}
