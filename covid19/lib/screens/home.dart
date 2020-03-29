import 'package:covid/widgets/cardFamily.dart';
import 'package:covid/widgets/cardMenu.dart';
import 'package:covid/widgets/cardStatistic.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 200,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 60.0,
                        backgroundImage: new NetworkImage(
                            'https://enfilme.com/img/content/77d7e74dd7a90bc3eefe8cf4ec02a51155_675_489.jpg'),
                      ),
                      Text("Full Name", style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      Text("Normal", style:TextStyle(fontSize: 18,color: Colors.green,fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total Statistic",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed('/statistics');
                      },
                      child: Text(
                        "More >",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              CardStatistic(),
              new SizedBox(
                height: 10.0,
              ),
              Text(
                "Coronavirus Map",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              new SizedBox(
                height: 100.0,
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Family and Friends",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed('/family');
                      },
                      child: Text(
                        "More >",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CardFamily(),
                    CardFamily(),
                    CardFamily(),
                    CardFamily(),
                    CardFamily(),
                  ],
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              CardMenu(
                onTap: (){
                  Navigator.of(context).pushNamed('/testCovid');
                },
                title: 'Coronavirus Test',
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ..',
                image: NetworkImage(
                    'https://cdn.imgbin.com/3/8/18/imgbin-computer-icons-test-survey-W5dFJzzsuSScfUd7GqYCGvQ2E.jpg'),
                fontColor: Colors.black87,
                backgroundColor: Color(0xffA6D5FA),
              ),
              new SizedBox(
                height: 10.0,
              ),
              CardMenu(
                onTap: (){
                  Navigator.of(context).pushNamed('/hospital');
                },
                title: 'List of Hospitals and Pharmacies',
                subTitle: '',
                image: NetworkImage(
                    'https://images.vexels.com/media/users/3/144204/isolated/preview/f6d082b22c3fbdc5d2927ff1c7cd57d4-icono-de-edificio-del-hospital-by-vexels.png'),
                fontColor: Colors.black87,
                backgroundColor: Color(0xffb2fab4),
              ),
              new SizedBox(
                height: 10.0,
              ),
              CardMenu(
                onTap: (){
                  Navigator.of(context).pushNamed('/news');
                },
                title: 'New',
                subTitle: '',
                image: NetworkImage(
                    'https://i0.pngocean.com/files/665/700/925/computer-icons-news-media-printing-advertising-news-ico.jpg'),
                fontColor: Colors.black87,
                backgroundColor: Color(0xffffd95b),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
