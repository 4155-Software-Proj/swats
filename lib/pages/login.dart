import 'package:flutter/material.dart';
import 'package:swats/services/dbDriver.dart';
import 'package:crypt/crypt.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();

    Future(() {
      final snackBar = SnackBar(
          backgroundColor: Colors.green[600],
          content: Text('Connection to DB was a Success!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'SWATS',
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Oswald',
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameTextController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Username',
                    // fillColor: Colors.grey[400],
                    // filled: true,
                    focusColor: Colors.amber,
                    floatingLabelStyle: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber),
                    ),
                    labelText: 'Password',
                    focusColor: Colors.amber,
                    floatingLabelStyle: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () async {
                    //Check user password
                    String userID = usernameTextController
                        .text; // Retrieve and store entered username
                    String password = passwordTextController.text;

                    //Query DB to get user profile and check password

                    dynamic userProfile = await DbDriver.getUser(userID);

                    if (userProfile == []) {
                      // TODO: Issue error for no user found, clear text fields
                    } else {
                      //Check to make sure users password is correct
                      //final parsedAppPassword = Crypt(password);
                      print(userProfile.toString());
                      print(userProfile[0]["passwordSecure"]);
                      final parsedDatabasePassword =
                          Crypt(userProfile[0]["passwordSecure"]);

                      if (parsedDatabasePassword.match(password)) {
                        //Check if the password match
                        print("Login Processed and Passed");
                        //Login User and proceed with creating session and setting session vars
                      } else {
                        print("password check failed");
                      }
                    }
                    //print('Test Push');
                    Navigator.pushReplacementNamed(context, '/mainMenu');
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
