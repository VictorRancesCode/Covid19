import 'package:covid/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Email"),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter you email';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("Password"),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter you password';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RoundedButton(
                  buttonName: "Enter",
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  width: screenSize.width,
                  height: 50.0,
                  borderWidth: 0.0,
                  buttonColor: Colors.indigo,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
