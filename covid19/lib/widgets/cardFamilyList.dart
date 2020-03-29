import 'package:flutter/material.dart';

class CardFamilyList extends StatefulWidget {
  CardFamilyList(
      {this.title,
      this.subTitle,
      this.fontColor,
      this.backgroundColor = Colors.white,
      this.image,
      this.onTap,
      this.fontSubColor});

  final String title;
  final String subTitle;
  final Color fontColor;
  final Color fontSubColor;
  final Color backgroundColor;
  final ImageProvider image;
  final Function onTap;

  @override
  _CardFamilyList createState() => _CardFamilyList();
}

class _CardFamilyList extends State<CardFamilyList> {
  List<Widget> activeSubTitle() {
    if (widget.subTitle != null && widget.subTitle != "") {
      return <Widget>[
        new SizedBox(
          height: 8.0,
        ),
        new Text(
          widget.subTitle,
          style: new TextStyle(
              fontSize: 14.0, color: widget.fontSubColor,fontWeight: FontWeight.bold),
        )
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        // width: screenSize.width,
        // height: 100,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            //color: Color(0XFFF5F6FF),
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 1.0,
                  offset: Offset(0.0, 1)
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: new CircleAvatar(
                  radius: 35.0,
                  backgroundImage: widget.image,
                  backgroundColor: Colors.transparent,
                )),
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    widget.title,
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: widget.fontColor,
                        fontWeight: FontWeight.bold),
                  ),
                  ...activeSubTitle()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
