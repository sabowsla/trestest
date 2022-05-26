import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trestest/nasa_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var matriz = [];
  var islas = "3";
  @override
  Widget build(BuildContext context) {
    var inputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 500,
              child: TextFormField(
                onChanged: (String val) {
                  inputController.text = val;
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
                child: matriz.isNotEmpty ? GridView.count(
                  crossAxisCount: matriz.length,
                  children: buildGrid(),
                ) : Container(),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            matriz = [
              [1, 1, 0, 1, 1],
              [1, 1, 0, 0, 0],
              [0, 1, 0, 0, 0],
              [0, 1, 0, 0, 1],
              [1, 1, 0, 1, 1]
            ];
            islas = numeroDeIslas(matriz).toString();
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NasaView()),
          );
        },
        tooltip: 'Reset Island',
        child: const Icon(Icons.replay_outlined),
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

dynamic copyMatrix(var matriz) {
  var newMatriz = [];
  for (int i = 0; i < matriz.length; i++) {
    newMatriz.add(List.from(matriz[i]));
  }
  return newMatriz;
}

dynamic generarMatriz(int tamano) {
  List<List<int>> matriz = [];

  for (var i = 0; i < tamano; i++) {
    List<int> list = <int>[];

    for (var j = 0; j < tamano; j++) {
      int randomVal = Random.secure().nextInt(2);
      list.add(randomVal);
    }
    matriz.add(list);
  }
  return matriz;
}

void conectada(var M, int i, int j, int ROW, int COL) {
  if (i < 0 || j < 0 || i > (ROW - 1) || j > (COL - 1) || M[i][j] != 1) {
    return;
  }

  if (M[i][j] == 1) {
    M[i][j] = 0;
    conectada(M, i + 1, j, ROW, COL);
    conectada(M, i - 1, j, ROW, COL);
    conectada(M, i, j + 1, ROW, COL);
    conectada(M, i, j - 1, ROW, COL);
  }
}

int numeroDeIslas(var _matriz) {
  var matriz = copyMatrix(_matriz);
  int ROW = matriz.length;
  int COL = matriz[0].length;

  int count = 0;
  for (int i = 0; i < ROW; i++) {
    for (int j = 0; j < COL; j++) {
      if (matriz[i][j] == 1) {
        matriz[i][j] = 0;
        count++;
        conectada(matriz, i + 1, j, ROW, COL);
        conectada(matriz, i - 1, j, ROW, COL);
        conectada(matriz, i, j + 1, ROW, COL);
        conectada(matriz, i, j - 1, ROW, COL);
      }
    }
  }

  return count;
}
