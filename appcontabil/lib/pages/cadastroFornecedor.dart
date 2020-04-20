import 'package:flutter/material.dart';

class CadastroFornecedor extends StatefulWidget {
  @override
  _CadastroFornecedorState createState() => _CadastroFornecedorState();
}

class _CadastroFornecedorState extends State<CadastroFornecedor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Fornecedor"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple[900],
            Colors.deepPurple[600],
            Colors.deepPurple[400],
          ]),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.01),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.06),
                child: Container(
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
                        )
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(children: <Widget>[
                      getFormField("Razão Social", Icons.business),
                      getFormField("Cnpj", Icons.business_center),
                      getFormField("Endereço", Icons.account_balance),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: MaterialButton(
                          color: Colors.deepPurple,
                          child: Text(
                            "Salvar Fornecedores",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getFormField(String hintText, IconData icone) {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            hintText: "$hintText",
            hintStyle: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
