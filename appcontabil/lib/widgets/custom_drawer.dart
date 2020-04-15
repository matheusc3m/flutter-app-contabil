import 'package:flutter/material.dart';
import 'package:appcontabil/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _builddrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, 
          colors: [
            Colors.deepPurple[50],
            Colors.deepPurple[300],
            Colors.deepPurple[700],
          ],
          end: Alignment.bottomCenter
        )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _builddrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 200.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 30,
                      left: 50,
                      child: Image.asset('lib/images/logo.png',
                      height: 100,
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Bem vindo, " ,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.assessment, "Dashboard", pageController, 0),
              DrawerTile(Icons.business, "Dados Empresa", pageController, 1),
              DrawerTile(Icons.home, "Entradas", pageController, 2),
              DrawerTile(Icons.home, "Saidas", pageController, 3),
              
            ],
          )
        ],
      )
    );
  }
}