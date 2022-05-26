import 'package:flutter/material.dart';
import 'package:trestest/header.dart';
import 'package:trestest/nav_bar.dart';
import 'package:trestest/results.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'categories.dart';
import 'favorites.dart';

class NasaView extends StatefulWidget {
  const NasaView({Key? key}) : super(key: key);

  @override
  State<NasaView> createState() => _NasaViewState();
}

class _NasaViewState extends State<NasaView> {
  var nasaLogo = "assets/nasa.png";
  String searchFor = "Happy Hours";
  List<ResultData> loadedResults = [];
  void onChange(String search) async {
    loadedResults = await _getGifs(search);
    print(loadedResults);
    setState(() {
      searchFor = search;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(nasaLogo: nasaLogo),
          const Favorites(),
          Categories(onChange: onChange),
          Results(loadedResults: loadedResults),
          const CustomBottonNavBar(),
        ],
      ),
    );
  }
}

Future<List<ResultData>> _getGifs(var _search) async {
  http.Response response;
  var _offset = 0;

  "IyO7FLT2n9WFb7wJA4qx1cXf68IoBq42";
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
