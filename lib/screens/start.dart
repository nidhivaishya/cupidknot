import 'package:flutter/material.dart';
import 'home.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/checklist.png',
            height: 240,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
            child: Text(
              'Your profile has been saved Successfully.',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            height: 50,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey[850],
                child: Text(
                  'Let\'s Start',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                }),
          )
        ],
      )),
    );
  }
}
