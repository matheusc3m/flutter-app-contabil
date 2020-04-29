import 'package:appcontabil/models/user_model.dart';
import 'package:appcontabil/pages/listagemLancamento.dart';
import 'package:appcontabil/pages/mainPage.dart';
import 'package:appcontabil/ui/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  runApp(MyApp());
  var db = Firestore.instance;
  DocumentSnapshot resultado =
      await db.collection("fornecedor").document("user1").get();
  print(resultado.documentID);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'App Contábil',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
