import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Fornecedor {
  String userId;
  String cnpj;
  String endereco;
  String razaoSocial;
  String telefone;
  String email;
  DocumentReference reference;

  Fornecedor(
      {this.userId,
      this.razaoSocial,
      this.cnpj,
      this.endereco,
      this.telefone,
      this.email});

  Fornecedor.fromMap(Map<String, dynamic> map, String id) {
    userId = map["userId"];

    cnpj = map["cnpj"];
    endereco = map["endereco"];
    razaoSocial = map["razao social"];
    telefone = map["telefone"];
    email = map["email"];
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
      String telefone, String email) {
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
