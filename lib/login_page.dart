import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _regexEmail() {
    Pattern _pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    bool _check = RegExp(_pattern).hasMatch(emailController.text);
    return _check;
  }

  SharedPreferences sp;
  bool userData;
  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    sp = await SharedPreferences.getInstance();
    userData = (sp.getBool("login") ?? true);
    print(userData);
    if (userData == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    email: sp.getString("email"),
                    password: sp.getString("password"),
                    sp: sp,
                  )));
    }
  }

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
                  errorText:
                      _validateEmail ? "Input correct email please!" : null,
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
                  errorText: _validatePassword
                      ? "Password is required! can\'t empty"
                      : null,
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
                String email = emailController.text;
                String password = passController.text;
                setState(() {
                  (_regexEmail() == false)
                      ? _validateEmail = true
                      : _validateEmail = false;
                  passController.text.isEmpty
                      ? _validatePassword = true
                      : _validatePassword = false;
                });
                if (_validateEmail || _validatePassword) {
                  return;
                }
                sp.setString("email", email);
                sp.setString("password", password);
                sp.setBool("login", false);
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                    builder: (context) => new Home(
                      email: email,
                      password: password,
                      sp: sp,
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
