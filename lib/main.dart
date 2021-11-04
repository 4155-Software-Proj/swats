import 'package:flutter/material.dart';
import 'package:swats/pages/loading.dart';
import 'package:swats/pages/login.dart';
import 'package:swats/pages/mainMenu.dart';
import 'package:swats/pages/lookUpOrder.dart';
import 'package:swats/pages/lookUpInfo.dart';
import 'package:swats/pages/orderCheckInScan.dart';
import 'package:swats/pages/orderCheckInDetails.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/mainMenu': (context) => MainMenu(),
      //Order Check-in Screen Flow
      //Scan In Here
      '/orderCheckInScan': (context) => OrderCheckInScan(),
      '/orderCheckIn': (context) => OrderCheckInDetails(),
      //Scan Bin Here
      //'/orderSummaryIn': (context) => OrderSummaryIn(), //This should have a confirmation pop in /mainMenu
      //Order Checkout Screen Flow
      //Scan Out Here
      //'/orderSummaryOut': (context) => OrderSummaryOut(), //This should have a confirmation pop in /mainMenu
      //Order Lookup Screen Flow
      '/lookUpOrder': (context) => LookUpOrder(),
      '/lookUpInfo': (context) => LookUpInfo(),
      //Reports Screen Flow
      //'/reportOptions': (context) => ReportOptions(),
      //'/reportOutOrder': (context) => ReportOutOrder(),
      //'/reportCurrProdQuant': (context) => ReportCurrProdQuant(),
    },
  ));
}
