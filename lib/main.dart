import 'package:flutter/material.dart';
import './home.dart';
import './login_page.dart';

void main() => runApp(MyApp());


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
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
      },
      home: LoginPage(),
    );
  }
}