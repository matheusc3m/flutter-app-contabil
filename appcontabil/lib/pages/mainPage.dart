import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/pages/HomePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadeAnimation(1.2, Text("EA ASSISTANT")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      body: HomePage(),
    );
  }
}
