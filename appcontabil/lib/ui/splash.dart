import 'dart:async';

import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/pages/login.page.dart';
import 'package:appcontabil/ui/loader_animator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return LoginPage();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.purple[700],
        Colors.deepPurple[800],
        Colors.deepPurple[900]
      ])),
      child: FadeAnimation(
        1.4,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Image.asset(
              'lib/images/logo.png',
              width: 150.0,
            ),
            Loading(
              radius: 15.0,
              dotRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
