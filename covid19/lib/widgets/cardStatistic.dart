import 'package:flutter/material.dart';

class CardStatistic extends StatelessWidget {
  CardStatistic({this.title=""});
  final String title;

  Widget getTitle(){
    if(this.title!=""){
      return new Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      );
    }
    return new SizedBox();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 1.0,
                  offset: Offset(0.0, 1)
              )
            ],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10
        ),
        child: Column(
          children: <Widget>[
            getTitle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "450",
                        style: TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text("Infected")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "450",
                        style: TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text("Dead")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "450",
                        style: TextStyle(fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text("Cured")
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
