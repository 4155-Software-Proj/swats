import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
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
                const TextField(
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
                const TextField(
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
                  style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: Colors.amber), primary: Colors.amber), 
                 
                  onPressed: () {
                    print('Test Push');
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
