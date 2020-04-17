import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var services = [
      "Cadastro de Mei",
      "Fornecedores",
      "Dashboard",
      "Fazer Lançamento"
    ];
    var images = [
      "lib/images/icons/mei.png",
      "lib/images/icons/fornecedor.png",
      "lib/images/icons/dashboard.png",
      "lib/images/icons/lancamento.png"
    ];
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          itemCount: services.length,
          gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2.6),
          )),
          itemBuilder: (BuildContext context, int index) {
            return FadeAnimation(
              1.2,
              Card(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Image.asset(images[index], height: 50, width: 50),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          services[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
