import 'package:appcontabil/models/fornecedor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class CadastroFornecedor extends StatefulWidget {
  final Fornecedor fornecedor;

  CadastroFornecedor(this.fornecedor);

  @override
  _CadastroFornecedorState createState() => _CadastroFornecedorState();
}

class _CadastroFornecedorState extends State<CadastroFornecedor> {
  Fornecedor f = Fornecedor();
  TextEditingController _razaoController;
  TextEditingController _cnpjController;
  TextEditingController _enderecoController;
  TextEditingController _telefoneController;
  TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _razaoController =
        new TextEditingController(text: widget.fornecedor.razaoSocial);

    _cnpjController = TextEditingController(text: widget.fornecedor.cnpj);
    _enderecoController =
        TextEditingController(text: widget.fornecedor.endereco);
    _telefoneController =
        TextEditingController(text: widget.fornecedor.telefone);
    _emailController = TextEditingController(text: widget.fornecedor.email);
  }

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
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(children: <Widget>[
                      getFormField(
                          "Razão Social", Icons.business, _razaoController),
                      getFormField(
                          "Cnpj", Icons.business_center, _cnpjController),
                      getFormField("Endereço", Icons.account_balance,
                          _enderecoController),
                      getFormField(
                          "Telefone", Icons.phone, _telefoneController),
                      getFormField("E-mail", Icons.email, _emailController),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: MaterialButton(
                          color: Colors.deepPurple,
                          child: widget.fornecedor.id != null
                              ? Text(
                                  "Atualizar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Salvar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                          onPressed: () {
                            f.addFornecedor(
                                _razaoController.text,
                                _cnpjController.text,
                                _enderecoController.text,
                                _telefoneController.text,
                                _emailController.text,
                                widget.fornecedor.id);
                            showAlert(
                              context: context,
                              body: "Seu fornecedor foi salvo com sucesso",
                            );
                            setState(() {
                              _cnpjController.text = "";
                              _enderecoController.text = "";
                              _razaoController.text = "";
                            });
                            print("cadastro enviado ao banco");
                          },
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

  getFormField(
      String hintText, IconData icone, TextEditingController controlador) {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
      child: TextFormField(
        controller: controlador,
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            hintText: "$hintText",
            hintStyle: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
