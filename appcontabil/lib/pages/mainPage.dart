import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/pages/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
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
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.deepPurple,
        backgroundColor: Color(0xFFF0F0F0),
        color: Colors.deepPurple[700],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
        ],
      ),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    return (_currentIndex == 0) ? HomePage() : Container();
  }
}
