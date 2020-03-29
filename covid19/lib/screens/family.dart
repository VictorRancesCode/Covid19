import 'package:covid/widgets/cardFamilyList.dart';
import 'package:covid/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class Family extends StatefulWidget {
  Family({Key key}) : super(key: key);

  @override
  _Family createState() => _Family();
}

class _Family extends State<Family> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Family and Friends"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RoundedButton(
              buttonName: "Add Family or Friend",
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
              width: screenSize.width,
              height: 50.0,
              borderWidth: 0.0,
              buttonColor: Colors.indigo,
              textColor: Colors.white,
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Expanded(
              child: ListView(
                children: <Widget>[
                  CardFamilyList(
                    title: "Roberto",
                    image: NetworkImage(
                        "https://www.cmtv.com.ar/imagenes_artistas/1633.jpg"),
                    subTitle: "Status: Normal",
                    backgroundColor: Colors.white,
                    fontColor: Colors.black87,
                    fontSubColor: Colors.green,
                  ),
                  CardFamilyList(
                    title: "Roberto",
                    image: NetworkImage(
                        "https://www.cmtv.com.ar/imagenes_artistas/1633.jpg"),
                    subTitle: "Status: Normal",
                    backgroundColor: Colors.white,
                    fontColor: Colors.black87,
                    fontSubColor: Colors.green,
                  ),
                  CardFamilyList(
                    title: "Roberto",
                    image: NetworkImage(
                        "https://www.cmtv.com.ar/imagenes_artistas/1633.jpg"),
                    subTitle: "Status: Normal",
                    backgroundColor: Colors.white,
                    fontColor: Colors.black87,
                    fontSubColor: Colors.green,
                  ),
                  CardFamilyList(
                    title: "Roberto",
                    image: NetworkImage(
                        "https://www.cmtv.com.ar/imagenes_artistas/1633.jpg"),
                    subTitle: "Status: Normal",
                    backgroundColor: Colors.white,
                    fontColor: Colors.black87,
                    fontSubColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
