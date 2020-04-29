import 'package:appcontabil/pages/cadastroFornecedor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ListaFornecedor extends StatefulWidget {
  @override
  _ListaFornecedorState createState() => _ListaFornecedorState();
}

class _ListaFornecedorState extends State<ListaFornecedor> {
  var lista = [
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "ABBC - ASSOCIACAO BRASILEIRA DOS BANCOS",
    "ASSOCIACAO SOCIAL GOOD BRASIL ",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA",
    "COMPANHIA ULTRAGAZ S A",
    "DB MASTER INFORMATICA LTDA",
    "CONCEPT MÓVEIS E DECORAÇÕES LTDA",
    "COACH GESTAO DE PESSOAS LTDA"
  ];
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: isSearching
            ? Text("Fornecedores (0)")
            : TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroFornecedor()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white70),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 80, left: 10, right: 10),
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle, size: 60),
                      title: Text(lista[index]),
                      subtitle: Text('CNPJ: 52.636.016/0001-99'),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
