import 'package:cupidknot/screens/account.dart';
import 'package:cupidknot/screens/home.dart';
import 'package:cupidknot/screens/sign_in.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/images/logo2.png',
                height: 300,
              ),
              Text(
                'Welcome !',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sign in or Sign up With Google',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              IconButton(
                icon: Image.asset('assets/images/google.png'),
                iconSize: 70,
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AccountScreen();
                          },
                        ),
                      );
                    }
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Contact with google',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/img.png',
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
