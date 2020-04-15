import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/models/user_model.dart';
import 'package:appcontabil/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);
            
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
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
                          'Crie sua conta',
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
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Nome Completo',
                                    prefixIcon: Icon(Icons.list)
                                  ),
                                  validator: (text){
                                    if (text.isEmpty) return "Preencha seu nome!";
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'E-mail',
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text){
                                    if(text.isEmpty || !text.contains("@")) 
                                      return "E-mail inválido!";
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: TextFormField(
                                    controller: _passController,
                                    obscureText:
                                        _showPassword == false ? true : false,
                                    decoration: InputDecoration(
                                      hintText: 'Senha',
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
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16, bottom: 62),
                                  child: TextField(
                                    obscureText:
                                        _showPassword == false ? true : false,
                                    decoration: InputDecoration(
                                      hintText: 'Confirme sua senha',
                                      prefixIcon: Icon(Icons.lock),
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
                                  ),
                                ),
                                MaterialButton(
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
                                        'CADASTRAR',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState.validate()){
                                      Map<String, dynamic> userData = {
                                        "name": _nameController.text,
                                        "email": _emailController.text,
                                      };

                                      model.signUp(
                                        userData: userData, 
                                        pass: _passController.text, 
                                        onSucess: _onSucess, 
                                        onFail: _onFail,
                                      );
                                    }
                                  },
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
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
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }
}

void _onSucess(){

}

void _onFail(){

}