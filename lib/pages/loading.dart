import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:mongo_dart/mongo_dart.dart';
import 'package:swats/services/dbDriver.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void fakeTime() async {
    //TODO: Establish Database connection here
    DbDriver dbdriver = DbDriver("dbUser", "D84QoKqKke81CHoQ", "swats");
    //await DbDriver.createConnection('dbUser', "D84QoKqKke81CHoQ", "swats");
    await dbdriver.createConnection();
    print('Successful Connection');
    dbdriver.setCollection('swatsCustomers');
    print('set DB successful');
    var result = await dbdriver.findOneResult("Jimmy R Lynch & Sons Inc");
    print( result );
    

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
