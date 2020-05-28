import 'package:cloud_firestore/cloud_firestore.dart';

class Lancamento {
  DateTime date;
  String descricao;
  bool tipo;
  double valor;
  String id;

  Lancamento({this.date, this.descricao, this.tipo, this.valor, this.id});

  Lancamento.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    descricao = json['descricao'];
    tipo = json['tipo'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['descricao'] = this.descricao;
    data['tipo'] = this.tipo;
    data['valor'] = this.valor;
    return data;
  }

  addLancamento(
      DateTime date, String descricao, bool tipo, double valor, String id) {
    if (id != null) {
      Lancamento l = Lancamento(
          date: date, descricao: descricao, tipo: tipo, valor: valor);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("lancamento")
              .document(id)
              .setData(l.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      Lancamento l = Lancamento(
          date: date, descricao: descricao, tipo: tipo, valor: valor);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("lancamento")
              .document()
              .setData(l.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
