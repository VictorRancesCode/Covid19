import 'package:flutter/material.dart';

class CardMenu extends StatefulWidget {
  CardMenu(
      {this.title,
      this.subTitle,
      this.fontColor,
      this.backgroundColor,
      this.image, this.onTap});

  final String title;
  final String subTitle;
  final Color fontColor;
  final Color backgroundColor;
  final ImageProvider image;
  final Function onTap;

  @override
  _CardMenu createState() => _CardMenu();
}

class _CardMenu extends State<CardMenu> {

  List<Widget> activeSubTitle(){
    if(widget.subTitle != null && widget.subTitle != "") {
      return <Widget>[
        new SizedBox(
          height: 8.0,
        ),
        new Text(
          widget.subTitle,
          style: new TextStyle(
              fontSize: 12.0, color: widget.fontColor.withOpacity(0.5)),
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
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            //color: Color(0XFFF5F6FF),
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: new CircleAvatar(
                    radius: 35.0, backgroundImage: widget.image,backgroundColor: Colors.transparent,)),
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
            )),
            new Padding(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: widget.fontColor.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
