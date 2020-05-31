import 'dart:async';

import 'package:appcontabil/models/fornecedor_model.dart';
import 'package:appcontabil/pages/cadastroFornecedor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListaFornecedor extends StatefulWidget {
  @override
  _ListaFornecedorState createState() => _ListaFornecedorState();
}

class _ListaFornecedorState extends State<ListaFornecedor> {
  var _searchKey = new TextEditingController();
  bool isSearching = false;
  Future retornaFuture() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn;
    if (isSearching == true) {
      qn = await firestore
          .collection("fornecedor")
          .where("razao social", isGreaterThanOrEqualTo: _searchKey.text)
          .getDocuments();
    } else {
      qn = await firestore.collection("fornecedor").getDocuments();
    }
    return qn;
  }

  Fornecedor f = Fornecedor();
  List<Fornecedor> items;
  var db = Firestore.instance;
  StreamSubscription<QuerySnapshot> fornecedorInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    fornecedorInscricao?.cancel();

    fornecedorInscricao = db
        .collection("fornecedor")
        .where('razao social', isEqualTo: "Empresa D")
        .snapshots()
        .listen((snapshot) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: isSearching == false
            ? Text("Fornecedores")
            : TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                onSubmitted: (value) {
                  setState(() {
                    _searchKey.text = value;
                  });
                },
                controller: _searchKey,
                decoration: InputDecoration(
                    hintText: "Pesquisar ",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20))),
        actions: <Widget>[
          IconButton(
            icon:
                isSearching == false ? Icon(Icons.search) : Icon(Icons.cancel),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroFornecedor(
                        Fornecedor(
                            cnpj: "",
                            razaoSocial: "",
                            endereco: "",
                            email: "",
                            telefone: "",
                            id: null),
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white70),
        child: FutureBuilder(
            /*meus dados*/ future: retornaFuture(),
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
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          var alertStyle = AlertStyle(
                              animationType: AnimationType.grow,
                              isCloseButton: false,
                              isOverlayTapDismiss: false,
                              descStyle: TextStyle(fontWeight: FontWeight.bold),
                              animationDuration: Duration(milliseconds: 200),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              titleStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              constraints: BoxConstraints.expand());
                          Alert(
                            context: context,
                            style: alertStyle,
                            title: "Informações deste fornecedor",
                            content: Column(
                              children: <Widget>[
                                getRowAlert("Razão social",
                                    "${documentos[index]["razao social"]}"),
                                getRowAlert(
                                    "Cnpj", "${documentos[index]["cnpj"]}"),
                                getRowAlert("Endereço",
                                    "${documentos[index]["endereco"]}"),
                                getRowAlert("Telefone",
                                    "${documentos[index]["telefone"]}"),
                                getRowAlert(
                                    "Email", "${documentos[index]["email"]}")
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Voltar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                color: Color.fromRGBO(0, 179, 134, 1.0),
                                radius: BorderRadius.circular(0.0),
                              ),
                            ],
                          ).show();
                        },
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.account_circle, size: 60),
                                title: Text(documentos[index]["razao social"]),
                                subtitle: Text(documentos[index]["cnpj"]),
                                trailing: Wrap(
                                  spacing: 2, // space between two icons
                                  children: <Widget>[
                                    IconButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CadastroFornecedor(
                                                      Fornecedor(
                                                          cnpj:
                                                              documentos[index]
                                                                  ["cnpj"],
                                                          razaoSocial: documentos[
                                                                  index]
                                                              ["razao social"],
                                                          endereco:
                                                              documentos[index]
                                                                  ["endereco"],
                                                          email:
                                                              documentos[index]
                                                                  ["email"],
                                                          telefone:
                                                              documentos[index]
                                                                  ["telefone"],
                                                          id: documentos[index]
                                                              .documentID),
                                                    )));
                                      },
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

getRowAlert(String primeiro, String segundo) {
  return Row(
    children: <Widget>[
      Text(
        "$primeiro: ",
        style: TextStyle(fontSize: 16),
        overflow: TextOverflow.fade,
      ),
      Flexible(
        flex: 1,
        child: Text(
          "$segundo",
          style: TextStyle(fontSize: 14, color: Colors.deepPurple),
        ),
      )
    ],
  );
}
