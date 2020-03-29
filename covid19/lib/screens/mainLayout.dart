import 'package:covid/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key key}) : super(key: key);

  @override
  _MainLayout createState() => _MainLayout();
}

class _MainLayout extends State<MainLayout> {


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: screenSize.height / 2.5,
                        child: Container(
                          margin: EdgeInsets.only(top: screenSize.height / 6),
                          child: Center(
                            child: Image(
                              image: ExactAssetImage("assets/icon.png"),
                              width: (screenSize.width < 500)
                                  ? 320.0
                                  : (screenSize.width / 4) + 12.0,
                              height: screenSize.height / 4 + 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: screenSize.height / 2.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 50.0),
                              child: Text(
                                "Welcome to Covid-19",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Hope is the dream of an awake man.",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(""),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: RoundedButton(
                                buttonName: "Login Now",
                                onTap: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                width: screenSize.width,
                                height: 50.0,
                                borderWidth: 0.0,
                                buttonColor: Colors.blue,
                                textColor: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: RoundedButton(
                                buttonName: "Create Accounts",
                                onTap: () {
                                  Navigator.of(context).pushNamed('/register');
                                },
                                width: screenSize.width,
                                height: 50.0,
                                borderWidth: 0.0,
                                buttonColor: Colors.white,
                                textColor: Colors.black,
                              ),
                            ),

//                          RaisedButton(
//                            child: Text("Iniciar Session Con Facebook"),
//                            onPressed: initiateFacebookLogin,
//                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
