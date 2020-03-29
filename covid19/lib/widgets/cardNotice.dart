import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CardNotice extends StatefulWidget {
  CardNotice(
      {this.title,
      this.description,
      this.fontColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.image,
      this.onTap,
      this.url="https://www.google.com/"});

  final String title;
  final String description;
  final Color fontColor;
  final Color backgroundColor;
  final String image;
  final Function onTap;
  final url;

  @override
  _CardNotice createState() => _CardNotice();
}

class _CardNotice extends State<CardNotice> {
  List<Widget> activeSubTitle() {
    if (widget.description != null && widget.description != "") {
      return <Widget>[
        new SizedBox(
          height: 8.0,
        ),
        new Text(
          widget.description,
          style: new TextStyle(
              fontSize: 12.0, color: widget.fontColor.withOpacity(0.7)),
        )
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () async {
        var url = widget.url;
        if (await canLaunch(url)) {
        await launch(url);
        } else {
        throw 'Could not launch $url';
        }
      },
      child: Container(
        // width: screenSize.width,
        // height: 100,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          //color: Color(0XFFF5F6FF),
          color: widget.backgroundColor,
          //color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 1.0, offset: Offset(0.0, 1))
          ],
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      widget.title,
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: widget.fontColor,
                          fontWeight: FontWeight.bold),
                    ),
                   Container(
                     margin: EdgeInsets.only(top: 5),
                     child:  new Row(
                       children: <Widget>[
                         Text("Source",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                         new SizedBox(
                           width: 10.0,
                         ),
                         Text("1 hours",style: TextStyle(color: Colors.black.withOpacity(0.7)))
                       ],
                     ),
                   ),
                    ...activeSubTitle(),
                  ],
                ),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(
                left: 10.0,
              ),
              child: Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
