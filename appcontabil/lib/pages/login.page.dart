import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/models/user_model.dart';
import 'package:appcontabil/pages/homePage.dart';
import 'package:appcontabil/pages/resetPass.page.dart';
import 'package:appcontabil/pages/signUp.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  /// Variáveis de formulário

  static final TextEditingController _pass = new TextEditingController();
  static final TextEditingController _emailUsuario =
      new TextEditingController();
  String get username => _emailUsuario.text;
  String get password => _pass.text;

  // Função de login Email/senha

  void doLogin(BuildContext context) async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      if (user != null) {
        _pass.text = '';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      print('logado em ${user.uid}');
    } catch (e) {
      print("Error: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Falha ao realizar o login"),
        backgroundColor: Colors.redAccent,
      ));
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  /// BUILD PAGINA DE LOGIN

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      if (model.isLoading) return Center(child: CircularProgressIndicator());

      return Container(
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
                key: _formKey,
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
                            height: 35,
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
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (text) {
                                        if (text.isEmpty || !text.contains("@"))
                                          return "E-mail inválido!";
                                      },
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
                                      validator: (text) {
                                        if (text.isEmpty || text.length < 6)
                                          return "Senha Invalida";
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.40,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FadeAnimation(
                                1.5,
                                FlatButton(
                                  child: Text(
                                    "Esqueceu a senha?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResetPassword()));
                                  },
                                  padding: EdgeInsets.zero,
                                )),
                          ),
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
                                child: Builder(
                                  builder: (context) => MaterialButton(
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
                                      if (_formKey.currentState.validate())
                                        doLogin(context);
                                      // TESTE model.signIn();
                                    },
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              1.7,
                              Text(
                                "Entre com as redes sociais",
                                style: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
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
                                        onPressed: () {
                                          model.getUser();
                                        },
                                      ),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                            1.9,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Não Possui uma conta?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                  },
                                  child: Text(
                                    "Crie Agora",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
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
      );
    }));
  }
}
