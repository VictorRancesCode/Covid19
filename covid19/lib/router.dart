import 'package:covid/screens/family.dart';
import 'package:covid/screens/home.dart';
import 'package:covid/screens/hospital.dart';
import 'package:covid/screens/login.dart';
import 'package:covid/screens/mainLayout.dart';
import 'package:covid/screens/map.dart';
import 'package:covid/screens/notice.dart';
import 'package:covid/screens/register.dart';
import 'package:covid/screens/statistics.dart';
import 'package:covid/screens/testCovid.dart';
import 'package:flutter/material.dart';

final router = {
  '/': (BuildContext context) => new MainLayout(),
};

getPageRoute(RouteSettings settings){
  dynamic data= settings.arguments;
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => MainLayout());
    case '/login':
      return MaterialPageRoute(builder: (_) => Login());
    case '/register':
      return MaterialPageRoute(builder: (_) => Register());
    case '/home':
      return MaterialPageRoute(builder: (_) => Home());
    case '/family':
      return MaterialPageRoute(builder: (_) => Family());
    case '/hospital':
      return MaterialPageRoute(builder: (_) => Hospital());
    case '/notice':
      return MaterialPageRoute(builder: (_) => Notice());
    case '/testCovid':
      return MaterialPageRoute(builder: (_) => TestCovid());
    case '/statistics':
      return MaterialPageRoute(builder: (_) => Statistics());
    case '/coronavirusMap':
      return MaterialPageRoute(builder: (_) => CoronavirusMap());
  }
}
