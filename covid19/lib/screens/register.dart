import 'package:covid/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget{
  Register({Key key}): super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register>{
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10,left: 10,top: 10),
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("First Name"),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter you email';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),

              Container(
                margin: EdgeInsets.only(top:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Last Name"),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter you password';
                        }
                        return null;
                      },
                    ),
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.only(top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Email"),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter you password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("CI"),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter you password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Password"),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter you password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),

              Container(
                margin: EdgeInsets.only(top:20),
                child: RoundedButton(
                  buttonName: "Register",
                  onTap: () {
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