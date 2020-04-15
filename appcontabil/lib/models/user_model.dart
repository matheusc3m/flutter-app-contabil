import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{ 

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  // Criando conta

  void signUp({@required Map<String, dynamic> userData,@required String pass,
    @required VoidCallback onSucess,@required VoidCallback onFail}) {

    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData["email"], 
      password: pass
    ).then((user) async {
      firebaseUser = user as FirebaseUser;

      Firestore.instance.collection("usuarios").document("cadastros").setData({
        'dados' : userData["email"],
        'nome' : userData["nome"],
      });
      

      onSucess();
      isLoading = false;
      notifyListeners();

      })
      .catchError((e){
        onFail();
        isLoading = false;
        notifyListeners();
      });
  }


  void recoverPass(){

  }

  // Salvar dados de Cadastro no banco NAO FUNCIONA AINDA

  // Future<Null> _saveUserData(Map<String, dynamic> userData) async {
  //   this.userData = userData;
  //   await _saveUserData(userData);
  // } 

  //Login com conta Google

  final GoogleSignIn googleSignIn = GoogleSignIn();

  void getUser() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final FirebaseUser user = authResult.user;

      
    } catch (error) {}
  }
}