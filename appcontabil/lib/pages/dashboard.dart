import 'package:appcontabil/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var menu = ["Total do Mês", "Despesas do Mês", "Receitas do Mês"];
    var total = ["500.00", "100.00", "600.00"];
    var tipo = ["b", "d", "r"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: menu.length,
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
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          menu[index],
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "R\$ ${total[index]}",
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
