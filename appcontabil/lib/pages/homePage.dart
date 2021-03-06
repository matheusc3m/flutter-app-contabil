import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:appcontabil/models/user_model.dart';
import 'package:appcontabil/pages/cadastroFornecedor.dart';
import 'package:appcontabil/pages/cadastroMei.dart';
import 'package:appcontabil/pages/dashboard.dart';
import 'package:appcontabil/pages/listagemFornecedor.dart';
import 'package:appcontabil/pages/listagemLancamento.dart';
import 'package:appcontabil/pages/login.page.dart';
import 'package:appcontabil/pages/qrPage.dart';
import 'package:appcontabil/pages/sobre.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var services = [
      "Fornecedores",
      "Dashboard",
      "Lançamentos",
      "Consultar NFCE na receita"
    ];
    var images = [
      "lib/images/icons/fornecedor.png",
      "lib/images/icons/dashboard.png",
      "lib/images/icons/lancamento.png",
      "lib/images/icons/qrcode.png",
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        title: FadeAnimation(1.2, Text("EA ASSISTANT")),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepPurple[700],
                  Colors.deepPurple[600],
                  Colors.blueAccent
                ])),
                child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: 100,
                    ))),
            CustomListTile(
                "Editar Minhas Informações", Icons.business, "editar", context),
            CustomListTile("Sobre", Icons.info, "sobre", context),
            CustomListTile("Logout", Icons.lock, "logout", context)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            itemCount: services.length,
            gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
            )),
            itemBuilder: (BuildContext context, int index) {
              return FadeAnimation(
                1.2,
                Card(
                  child: InkWell(
                    onTap: () {
                      if (index == 0)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaFornecedor()));
                      else if (index == 1)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardPage()));
                      else if (index == 2)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaLancamento()));
                      else if (index == 3)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRViewExample()));
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Image.asset(images[index], height: 50, width: 50),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            services[index],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

CustomListTile(
    String texto, IconData icon, String pagina, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: InkWell(
        splashColor: Colors.redAccent,
        onTap: () {
          if (pagina == "editar") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroMei(
                          titulo: "Editar",
                        )));
          }
          if (pagina == "logout") {
            UserModel usuario;

            usuario.logout();
          }
          if (pagina == "sobre") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SobrePage()));
          }
        },
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(
                  icon,
                  color: Colors.deepPurple,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(texto, style: TextStyle(fontSize: 15.0)),
                ),
              ]),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    ),
  );
}
