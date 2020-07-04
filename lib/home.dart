import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String email;
  final String password;

  Home({Key key, this.email, this.password}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                "Data Akun:",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Text(
              "email address : " + email,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "password : " + password,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: (){Navigator.pushReplacementNamed(context, '/login');},
              child: Container(
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
