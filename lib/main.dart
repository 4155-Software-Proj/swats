import 'package:flutter/material.dart';
import 'package:swats/pages/loading.dart';
import 'package:swats/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      //'/mainMenu': (context) => MainMenu(),
    },
  ));
}
