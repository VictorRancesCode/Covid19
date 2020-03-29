import 'package:flutter/material.dart';
import 'package:covid/router.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Covid19',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColorBrightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return getPageRoute(settings);
      },
      //routes: router,
    );
  }
}
