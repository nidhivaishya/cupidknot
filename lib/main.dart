import 'package:cupidknot/screens/home.dart';
import 'package:cupidknot/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Sen'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
        });
  }
}
