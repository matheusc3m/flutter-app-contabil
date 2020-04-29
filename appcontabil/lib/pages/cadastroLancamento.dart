import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';

class CadastroLancamento extends StatefulWidget {
  @override
  _CadastroLancamentoState createState() => _CadastroLancamentoState();
}

class _CadastroLancamentoState extends State<CadastroLancamento> {
  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazer Lançamento"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple[900],
              Colors.deepPurple[600],
              Colors.deepPurple[400],
            ]),
          ),
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.only(bottom: 200),
            child: FadeAnimation(
              0.2,
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple[900],
                        blurRadius: 10, // soften the shadow
                        spreadRadius: 8.0, //extend the shadow
                        offset: Offset(
                          10.0, // Move to right 10  horizontally
                          9, // Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      0.3,
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.description),
                          hintText: ("Descrição"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      0.4,
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.monetization_on),
                          hintText: ("Valor"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      0.5,
                      DateField(
                        label: "Selecionar a data",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: ("Valor"),
                        ),
                        selectedDate: selectedDate,
                        onDateSelected: (DateTime date) {
                          setState(() {
                            selectedDate = date;
                            print(selectedDate);
                          });
                        },
                        lastDate: DateTime.now(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      0.6,
                      FlutterRadioButtonGroup(
                          items: [
                            "Receita",
                            "Despesa",
                          ],
                          onSelected: (String selected) {
                            print("Selected: $selected");
                          }),
                    ),
                    FadeAnimation(
                      0.7,
                      MaterialButton(
                        color: Colors.deepPurple,
                        child: Text(
                          "Salvar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
