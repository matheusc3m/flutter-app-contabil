import 'dart:async';

import 'package:appcontabil/models/fornecedor_model.dart';
import 'package:appcontabil/pages/cadastroFornecedor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class ListaFornecedor extends StatefulWidget {
  @override
  _ListaFornecedorState createState() => _ListaFornecedorState();
}

class _ListaFornecedorState extends State<ListaFornecedor> {
  Fornecedor f = Fornecedor();
  List<Fornecedor> items;
  var db = Firestore.instance;
  StreamSubscription<QuerySnapshot> fornecedorInscricao;
  @override
  void initState() {
    super.initState();
    items = List();
    fornecedorInscricao?.cancel();

    fornecedorInscricao =
        db.collection("fornecedor").snapshots().listen((snapshot) {
      final List<Fornecedor> fornecedores = snapshot.documents
          .map(
            (documentSnapshot) => Fornecedor.fromMap(
                documentSnapshot.data, documentSnapshot.documentID),
          )
          .toList();
      setState(() {
        this.items = fornecedores;
      });
    });
  }

  @override
  void dispose() {
    fornecedorInscricao?.cancel();
    super.dispose();
  }

  var lista = [
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA"
  ];
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: isSearching
            ? Text("Fornecedores (${items.length})")
            : TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Pesquisar ",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20))),
        actions: <Widget>[
          IconButton(
            icon: isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                print(isSearching);
              });
            },
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroFornecedor()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white70),
        child: StreamBuilder<QuerySnapshot>(
            /*meus dados*/ stream: f.getListaFornecedores(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> documentos = snapshot.data.documents;
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 80, left: 10, right: 10),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.account_circle, size: 60),
                                title: Text(items[index].razaoSocial),
                                subtitle: Text(items[index].cnpj),
                                trailing: Wrap(
                                  spacing: 2, // space between two icons
                                  children: <Widget>[
                                    IconButton(
                                      color: Colors.green,
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        showAlert(
                                          context: context,
                                          title: "Apagar fornecedor",
                                          body:
                                              "Tem certeza que deseja apagar o fornecedor?",
                                          actions: [
                                            AlertAction(
                                              text: "Apagar",
                                              isDestructiveAction: true,
                                              onPressed: () {
                                                f.deletaFornecedor(context,
                                                    documentos[index], index);
                                              },
                                            ),
                                          ],
                                          cancelable: true,
                                        );
                                      },
                                      icon: const Icon(Icons.delete_outline),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
              }
            }),
      ),
    );
  }
}
