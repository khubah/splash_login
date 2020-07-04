import 'package:flutter/material.dart';
import 'package:splash_login/dashboard.dart';
import './login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash And Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/login' :(context) => LoginPage(),
        '/dashboard' : (context) => Dashboard(),
      },
      home: LoginPage(),
    );
  }
}

