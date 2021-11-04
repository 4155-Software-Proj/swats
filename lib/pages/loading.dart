import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void fakeTime() async {
    //TODO: Establish Database connection here
    await Future.delayed(
        Duration(seconds: 5)); //TODO: Remove in prod, fake wait

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
