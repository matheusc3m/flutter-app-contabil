import 'dart:async';

import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/models/lancamento_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Lancamento l = Lancamento();
  List<Lancamento> items;
  var db = Firestore.instance;
  StreamSubscription<QuerySnapshot> lancamentoInscricao;
  @override
  void initState() {
    super.initState();

    items = List();
    lancamentoInscricao?.cancel();

    lancamentoInscricao =
        db.collection("lancamento").snapshots().listen((snapshot) {
      final List<Lancamento> lancamentos = snapshot.documents
          .map(
            (documentSnapshot) => Lancamento.fromMap(
                documentSnapshot.data, documentSnapshot.documentID),
          )
          .toList();

      setState(() {
        this.items = lancamentos;

        print(items.length);
      });
    });
  }

  @override
  void dispose() {
    lancamentoInscricao?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalReceita = 0;
    double totalDespesa = 0;
    double total = 0;

    items.forEach((element) {
      if (element.tipo == true) {
        totalReceita += element.valor;
      } else if (element.tipo == false) {
        totalDespesa += element.valor;
      }
    });
    print(totalReceita);
    total = totalReceita - totalDespesa;
    var array = [
      "$total",
      "$totalDespesa",
      "$totalReceita",
    ];
    var menu = ["Total do Mês", "Despesas do Mês", "Receitas do Mês"];

    var tipo = ["b", "d", "r"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              subtitle: _getText(total),
              title: Center(
                  child: Text(
                "Nesse mês sua empresa obteve ",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.deepPurple),
              )),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: array.length,
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4.3),
                )),
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                    1.2,
                    Card(
                      color: _getMyColor(tipo[index]),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                menu[index],
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              "R\$ ${array[index]}",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Color _getMyColor(var tipo) {
  if (tipo == "r") {
    return Colors.lightGreen;
  } else if (tipo == "d") {
    return Colors.redAccent;
  } else
    return Colors.grey;
}

Widget _getText(numero) {
  if (numero < 0)
    return Text(
      "PREJUÍZO",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 17, color: Colors.red, fontWeight: FontWeight.w800),
    );
  if (numero > 0)
    return Text(
      "LUCRO",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 17, color: Colors.green, fontWeight: FontWeight.w800),
    );
  if (numero == 0)
    return Text(
      "Equilíbrio entre Receitas e Despesas",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w800),
    );
}
