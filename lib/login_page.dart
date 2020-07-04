import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "email address",
                  errorText: _validateEmail ? "email is required! can\'t empty" : null,
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
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "password",
                  errorText: _validatePassword ? "Password is required! can\'t empty" : null,
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
              onPressed: () async {
                setState(() {
                  emailController.text.isEmpty
                      ? _validateEmail = true
                      : _validateEmail = false;
                  passController.text.isEmpty
                      ? _validatePassword = true
                      : _validatePassword = false;
                });
                if (_validateEmail || _validatePassword){
                  return;
                }
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                    settings: const RouteSettings(name: '/home'),
                    builder: (context) => new Home(
                      email: emailController.text,
                      password: passController.text,
                    ),
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
