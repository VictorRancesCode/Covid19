import 'package:flutter/material.dart';

class CardFamily extends StatefulWidget{
  CardFamily();

  @override
  _CardFamily createState() => _CardFamily();
}

class _CardFamily extends State<CardFamily>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
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
      child: Column(
        children: <Widget>[
          Image.network("https://www.pngkey.com/png/full/950-9501315_katie-notopoulos-katienotopoulos-i-write-about-tech-user.png", height: 70,),
          Text("Name", style: TextStyle(fontSize: 18),),
          Text("State", style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}