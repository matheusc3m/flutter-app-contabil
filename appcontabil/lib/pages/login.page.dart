import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.deepPurple[900],
          Colors.deepPurple[800],
          Colors.deepPurple[400]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1,
                    Text(
                      "EA ASSISTANT",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1.3,
                    Text(
                      "AQUI VAI FICAR A LOGO",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)
                  )
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                                )
                              ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[200]
                                      )
                                    )
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Senha",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
<<<<<<< HEAD
                            1.5,
                            FlatButton(
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              onPressed: () {},
                            )),
=======
                          1.5,
                          Text(
                            "Esqueceu a senha?",
                            style: TextStyle(color: Colors.grey),
                          )
                        ),
>>>>>>> 50b7addbb1f432b3da8a151c489091a0a2b730e4
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
<<<<<<< HEAD
                            1.6,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue[900]),
                              child: FlatButton(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text("Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
=======
                          1.6,
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.deepPurple[900]
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
>>>>>>> 50b7addbb1f432b3da8a151c489091a0a2b730e4
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.purple[900]),
                              child: FlatButton(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text("Criar Conta",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                                onPressed: () {},
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          1.7,
                          Text(
                            "Login pelas redes sociais",
                            style: TextStyle(color: Colors.grey),
                          )
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(
<<<<<<< HEAD
                                  1.8,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue),
                                    child: FlatButton(
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
=======
                                1.8,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
>>>>>>> 50b7addbb1f432b3da8a151c489091a0a2b730e4
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                )
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: FadeAnimation(
<<<<<<< HEAD
                                  1.9,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: FlatButton(
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
=======
                                1.9,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Github",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
>>>>>>> 50b7addbb1f432b3da8a151c489091a0a2b730e4
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
