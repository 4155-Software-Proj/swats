import 'package:flutter/material.dart';
import 'package:swats/pages/loading.dart';
import 'package:swats/pages/login.dart';
import 'package:swats/pages/mainMenu.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/mainMenu': (context) => MainMenu(),
      //Order Check-in Screen Flow
      //Scan In Here
      //'/orderCheckIn': (context) => OrderCheckIn(),
      //Scan Bin Here
      //'/orderSummaryIn': (context) => OrderSummaryIn(), //This should have a confirmation pop in /mainMenu
      //Order Checkout Screen Flow
      //Scan Out Here
      //'/orderSummaryOut': (context) => OrderSummaryOut(), //This should have a confirmation pop in /mainMenu
      //Order Lookup Screen Flow
      //'/lookUpOrder': (context) => LookUpOrder(),
      //'/lookUpInfo': (context) => LookUpInfo(), 
      //Reports Screen Flow
      //'/reportOptions': (context) => ReportOptions(),
      //'/reportOutOrder': (context) => ReportOutOrder(),
      //'/reportCurrProdQuant': (context) => ReportCurrProdQuant(),
    },
  ));
}
