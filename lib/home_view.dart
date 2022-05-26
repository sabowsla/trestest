import 'package:flutter/material.dart';

import 'funcs.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    var matriz = [];
  var islas = "3";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 500,
              child: TextFormField(
                onChanged: (String val) {
                  int? tamano = int.tryParse(val);
                  if (tamano != null) {
                    setState(() {
                      matriz = generarMatriz(tamano);

                      islas = numeroDeIslas(matriz).toString();
                    });
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Ingrese el tamaño de la matriz",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 500,
                height: 500,
                child: matriz.isNotEmpty
                    ? GridView.count(
                        crossAxisCount: matriz.length,
                        children: buildGrid(),
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 500,
                child: Text("Islas Calculadas $islas"),
              ),
            ),
          ],
        ),
      );
  }
  
  List<Widget> buildGrid() {
    List<Widget> values = [];

    for (var i = 0; i < matriz.length; i++) {
      for (var j = 0; j < matriz[i].length; j++) {
        double size = 500 / matriz.length;
        var e = matriz[i][j];
        Color color = e == 1 ? Colors.green : Colors.blue;
        var container = Container(
          child: Container(
            width: size,
            height: size,
            color: color,
            child: InkWell(
              onTap: () {
                setState(() {
                  matriz[i][j] = matriz[i][j] == 0 ? 1 : 0;
                  islas = numeroDeIslas(matriz).toString();
                });
              },
            ),
          ),
        );

        values.add(container);
      }
    }

    return values;
  }
}

