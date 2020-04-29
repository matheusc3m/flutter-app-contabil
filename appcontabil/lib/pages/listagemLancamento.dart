import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/pages/cadastroLancamento.dart';
import 'package:flutter/material.dart';

class ListaLancamento extends StatefulWidget {
  @override
  _ListaLancamentoState createState() => _ListaLancamentoState();
}

class _ListaLancamentoState extends State<ListaLancamento> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroLancamento()));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lançamentos"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 80),
          itemCount: lista.length,
          itemBuilder: (context, i) {
            return FadeAnimation(
              0.4,
              Card(
                color: cor[i] == false ? Colors.red[300] : Colors.green,
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  trailing: Wrap(
                    spacing: 10, // space between two icons
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                      ),
                      Icon(
                        Icons.delete_outline,
                      ),
                    ],
                  ),
                  title: Text(
                    lista[i],
                    style: TextStyle(
                        color: Colors.white60, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
