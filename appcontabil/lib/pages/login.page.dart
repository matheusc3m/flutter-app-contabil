import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/ui/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  @override

  /// Variáveis de formulário

  static final TextEditingController _pass = new TextEditingController();
  static final TextEditingController _emailUsuario =
      new TextEditingController();
  String get username => _emailUsuario.text;
  String get password => _pass.text;

  void doLogin(BuildContext context) async {
    try {
      AuthResult user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
      if (user != null) {
        _pass.text = '';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
      }
      print('logado em ${user.user}');
    } catch (e) {
      print("Error: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Falha ao realizar o login"),
        backgroundColor: Colors.redAccent,
      ));
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

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
            Expanded(
              child: Form(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FadeAnimation(
                                  1.3,
                                  Center(
                                    child: Image.asset(
                                      'lib/images/logo.png',
                                      height: 140,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      controller: _emailUsuario,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.email),
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller: _pass,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        hintText: "Senha",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        suffixIcon: GestureDetector(
                                          child: Icon(_showPassword == false
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onTap: () {
                                            setState(() {
                                              _showPassword = !_showPassword;
                                            });
                                          },
                                        ),
                                      ),
                                      obscureText:
                                          _showPassword == false ? true : false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.40,
                          ),
                          FadeAnimation(
                              1.5,
                              FlatButton(
                                child: Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 0.40,
                          ),
                          FadeAnimation(
                              1.6,
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.deepPurple[900]),
                                child: MaterialButton(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text("Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                  onPressed: () {
                                    doLogin(context);
                                  },
                                ),
                              )),
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
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeAnimation(
                                    1.8,
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.blue),
                                      child: FlatButton(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text("Facebook",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                        onPressed: () {},
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: FadeAnimation(
                                    1.8,
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: FlatButton(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text("Google",
                                              style: TextStyle(
                                                color: Colors.redAccent[700],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                        onPressed: () {},
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
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
