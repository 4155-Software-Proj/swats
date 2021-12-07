import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swats/services/dbDriver.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void fakeTime() async {
    // dynamic customers = await DbDriver.getCustomers();
    // dynamic order = await DbDriver.getOrder("23456");
    // dynamic orders = await DbDriver.getOrdersByCustomer("I00100");
    dynamic customers = await DbDriver.getCustomersAccountAndNamePartial("jimmy");
    //TODO: Establish Database connection here
    await Future.delayed(
        Duration(seconds: 5)); //TODO: Remove in prod, fake wait
    // print(customers.toString());
    // print(order.toString());
    print(customers);
    // print(orders[1].toString());
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fakeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
