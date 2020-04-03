import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.deepPurple,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
            ),
          ],
        ),
      ),
    );
  }
}
