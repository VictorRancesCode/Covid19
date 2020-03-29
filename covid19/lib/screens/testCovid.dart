import 'package:flutter/material.dart';


class TestCovid extends StatefulWidget {
  TestCovid({Key key}) : super(key: key);

  @override
  _TestCovid createState() => _TestCovid();
}

class _TestCovid extends State<TestCovid>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Covid"),
      ),
      body: Text("Test"),
    );
  }
}