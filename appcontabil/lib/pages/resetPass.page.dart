import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/pages/login.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  static final TextEditingController _emailUsuario =
      new TextEditingController();
  String get emailUsuario => _emailUsuario.text;

  void resetPass(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailUsuario);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("FOI ENVIADO AO SEU EMAIL"),
          backgroundColor: Colors.green));
    } catch (e) {
      //print("Error: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Erro ao enviar"),
        backgroundColor: Colors.redAccent,
      ));
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              left: 32,
              child: FadeAnimation(
                1.1,
                Text(
                  'Recupere sua conta',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 190,
              child: Container(
                padding: EdgeInsets.all(32),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(62),
                        topRight: Radius.circular(62))),
                child: FadeAnimation(
                  1.2,
                  Form(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                          size: 150,
                        ),
                        TextField(
                          controller: _emailUsuario,
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                          ),
                        ),
                        Builder(
                          builder: (context) => MaterialButton(
                            child: Container(
                              height: 45,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                              child: Center(
                                child: Text(
                                  'ENVIAR',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            onPressed: () {
                              resetPass(context);
                            },
                          ),
                        ),
                        Container(
                          height: 8,
                        ),
                        Container(
                          height: 70,
                        ),
                        Container(
                          height: 45,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          child: MaterialButton(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.arrow_back),
                                  Text(
                                    'Voltar para login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ),
                        ),
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
