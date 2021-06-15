import 'package:cupidknot/screens/sign_in.dart';
import 'package:cupidknot/screens/welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/welcome';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo2.png',
              height: 220,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Text(
                  'Cupid Knot is one of the best Matchmaking and most trusted matrimonial service provider in India. Our 100% Secured Matrimony App especially made for the Jain, Agarwal and Maheshwari communities from all over the worls is developed by using the latest technologies.'),
            ),
            RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.yellow[600],
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }), ModalRoute.withName('/'));
                },
                icon: Icon(Icons.logout),
                label: Text('Sign Out')),
          ],
        )),
      ),
    );
  }
}
