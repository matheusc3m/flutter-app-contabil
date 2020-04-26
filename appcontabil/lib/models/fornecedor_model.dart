import 'package:cloud_firestore/cloud_firestore.dart';

class Fornecedor {
  String userId;
  String cnpj;
  String endereco;
  String razaoSocial;
  DocumentReference reference;

  Fornecedor({this.userId, this.razaoSocial, this.cnpj, this.endereco});

  Fornecedor.fromMap(Map<String, dynamic> map, {this.reference}) {
    userId = map["userId"];

    cnpj = map["cnpj"];
    endereco = map["endereco"];
    razaoSocial = map["razao social"];
  }
  Fornecedor.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {
      "userId": userId,
      "cnpj": cnpj,
      "endereco": endereco,
      "razao social": razaoSocial
    };
  }

  addFornecedor(String razaosocial, String cnpj, String endereco) {
    Fornecedor f =
        Fornecedor(razaoSocial: razaosocial, cnpj: cnpj, endereco: endereco);
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
