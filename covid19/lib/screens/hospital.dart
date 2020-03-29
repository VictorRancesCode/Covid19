import 'package:flutter/material.dart';


class Hospital extends StatefulWidget {
  Hospital({Key key}) : super(key: key);

  @override
  _Hospital createState() => _Hospital();
}

class _Hospital extends State<Hospital>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Hospitals and Pharmacies"),
      ),
      body: Text("Hospitals"),
    );
  }
}