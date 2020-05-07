import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Fornecedor {
  String userId;
  String cnpj;
  String endereco;
  String razaoSocial;
  String telefone;
  String email;
  String id;

  Fornecedor(
      {this.userId,
      this.razaoSocial,
      this.cnpj,
      this.endereco,
      this.telefone,
      this.email,
      this.id});

  Fornecedor.fromMap(Map<String, dynamic> map, String id) {
    userId = map["userId"];

    this.cnpj = map["cnpj"];
    this.endereco = map["endereco"];
    this.razaoSocial = map["razao social"];
    this.telefone = map["telefone"];
    this.email = map["email"];
    this.id = id ?? '';
  }
  Fornecedor.map(dynamic obj) {
    this.cnpj = obj['cnpj'];
    this.endereco = obj['endereco'];
    this.razaoSocial = obj['razao social'];
    this.telefone = obj['telefone'];
    this.email = obj['email'];
    this.id = obj['id'];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['cnpj'] = cnpj;
    map['endereco'] = endereco;
    map['razao social'] = razaoSocial;
    map['telefone'] = telefone;
    map['email'] = email;
    return map;
  }

  toJson() {
    return {
      "userId": userId,
      "cnpj": cnpj,
      "endereco": endereco,
      "razao social": razaoSocial,
      "telefone": telefone,
      "email": email,
    };
  }

  Stream<QuerySnapshot> getListaFornecedores() {
    return Firestore.instance.collection("fornecedor").snapshots();
  }

  void deletaFornecedor(
      BuildContext context, DocumentSnapshot doc, int position) async {
    var db = Firestore.instance;
    db.collection("fornecedor").document(doc.documentID).delete();
  }

  addFornecedor(String razaosocial, String cnpj, String endereco,
      String telefone, String email, String id) {
    if (id != null) {
      Fornecedor f = Fornecedor(
          razaoSocial: razaosocial,
          cnpj: cnpj,
          endereco: endereco,
          telefone: telefone,
          email: email);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("fornecedor")
              .document(id)
              .setData(f.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      Fornecedor f = Fornecedor(
          razaoSocial: razaosocial,
          cnpj: cnpj,
          endereco: endereco,
          telefone: telefone,
          email: email);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("fornecedor")
              .document()
              .setData(f.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
