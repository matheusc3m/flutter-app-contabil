import 'dart:async';

import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/models/lancamento_model.dart';
import 'package:appcontabil/pages/cadastroLancamento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ListaLancamento extends StatefulWidget {
  @override
  _ListaLancamentoState createState() => _ListaLancamentoState();
}

class _ListaLancamentoState extends State<ListaLancamento> {
  Lancamento l = Lancamento();
  List<Lancamento> items;
  var db = Firestore.instance;
  StreamSubscription<QuerySnapshot> lancamentoInscricao;
  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
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

  var lista = [
    "Aluguel",
    "Venda de Produto",
    "Conta de luz",
  ];
  var cor = [
    false,
    true,
    false,
  ];
  var dataAtual = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  var formatterCalendar = new DateFormat('MM-yyyy');
  CalendarController calendarController;
  String dataFormatada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroLancamento(
                      Lancamento(descricao: "", valor: 0, id: null))));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lançamentos"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            TableCalendar(
              calendarController: calendarController,
              locale: "pt_BR",
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                centerHeaderTitle: true,
              ),
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: false, contentPadding: EdgeInsets.all(0)),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.transparent),
                weekendStyle: TextStyle(color: Colors.transparent),
              ),
              rowHeight: 0,
              initialCalendarFormat: CalendarFormat.month,
              onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
                print(dateFirst);

                dataFormatada = formatterCalendar.format(dateFirst);
                // _allMovMes(dataFormatada);

                print("DATA FORMATADA CALENDAR $dataFormatada");

                //print("Data Inicial: $dateFirst ....... Data Final: $dateLast");
              },
            ),
            Text(
              "Todos os lançamentos desse mês",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  /*meus dados*/ stream: l.getListaLancamentos(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<DocumentSnapshot> documentos =
                            snapshot.data.documents;
                        return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 80),
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeAnimation(
                              0.4,
                              Card(
                                color: items[index].tipo == false
                                    ? Colors.red[300]
                                    : Colors.green,
                                child: ListTile(
                                  leading: Icon(Icons.monetization_on),
                                  trailing: Wrap(
                                    spacing: 10, // space between two icons
                                    children: <Widget>[
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(Icons.delete_forever),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    items[index].descricao,
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
