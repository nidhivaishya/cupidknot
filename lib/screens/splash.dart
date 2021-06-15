import 'dart:async';
import 'package:cupidknot/screens/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/images/Logo.png',
              height: 200,
            ),
            Text(
              'Chalo Banaye,',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Ek Naya Rishta',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/images/img.png',
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
