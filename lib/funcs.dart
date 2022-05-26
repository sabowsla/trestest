import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

Future<List<ResultData>> getGifs(var _search) async {
  http.Response response;
  var _offset = 0;

  "U5fSVkK3pds9UL6CDRA8X5Bp0SP4SQ7w";
  Uri uri = Uri.parse(
      'https://api.giphy.com/v1/gifs/search?api_key=U5fSVkK3pds9UL6CDRA8X5Bp0SP4SQ7w&q=$_search&limit=19&offset=$_offset&rating=g&lang=pt');
  response = await http.get(uri);
  Map decoded = json.decode(response.body);
  List<ResultData> data = [];
  for (int i = 0; i < decoded["data"].length; i++) {
    var url = decoded["data"][i]["images"]["original"]["url"];
    var title = decoded["data"][i]["title"];
    var _result = ResultData(url: url, title: title);
    data.add(_result);
  }

  return data;
}

class ResultData {
  String? url;
  String? title;
  ResultData({this.title, this.url});
}
