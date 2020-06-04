import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o EA Assistant"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Image.asset(
              'lib/images/sobre.jpg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Text(
                  "Bem vindo ao EA Assistant \nO novo parceiro do MEI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Com ele é possível controlar todos os seus débitos, créditos e gastos futuros. O EA Assistant foi criado a partir da ideia do grupo X, com o objetivo de facilitar o controle de gastos de todos os MEI's no dia a dia e também conta com um cadastro de fornecedores para que você MEI, esteja sempre mantendo sua lista de fornecedores atualizada.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("MateusM.jpeg"),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("MatheusC.jpeg"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("Ygor.jpg"),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("Josue.jpeg"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("Italo.jpeg"),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("gay.jpg"),
                    ],
                  ),
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _RetornaFoto(String nome) {
    return Container(
        height: 150,
        width: 150,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
            'lib/images/$nome',
          ),
        ));
  }
}
