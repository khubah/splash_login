import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
                autofocus: false,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                    settings: const RouteSettings(name: '/home'),
                    builder: (context) => new Home(email: emailController.text, password: passController.text,),
                  ),
                );
              },
              child: Container(
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
