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
        .where('razao social', isGreaterThan: "")
        .where('razao social', isGreaterThanOrEqualTo: "Empresa C")
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
                                    "${items[index].razaoSocial}"),
                                getRowAlert("Cnpj", "${items[index].cnpj}"),
                                getRowAlert(
                                    "Endereço", "${items[index].endereco}"),
                                getRowAlert(
                                    "Telefone", "${items[index].telefone}"),
                                getRowAlert("Email", "${items[index].email}")
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
                                title: Text(items[index].razaoSocial),
                                subtitle: Text(items[index].cnpj),
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
                                                              items[index].cnpj,
                                                          razaoSocial:
                                                              items[index]
                                                                  .razaoSocial,
                                                          endereco: items[index]
                                                              .endereco,
                                                          email: items[index]
                                                              .email,
                                                          telefone: items[index]
                                                              .telefone,
                                                          id: items[index].id),
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
