import 'package:flutter/material.dart';
import 'package:trestest/funcs.dart';
import 'package:trestest/results.dart';

class SearchView extends StatefulWidget {
  final List<ResultData>? favorites;
  const SearchView({Key? key, this.favorites}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ResultData> results = [];

  void onChange(String search) async {
    print("Searching for");
    results = await getGifs(search);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search For"),
      ),
      body: widget.favorites!.isEmpty
          ? ListView(
    
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  child: const Text(
                    "Lets Search",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (String search) {
                      onChange(search);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ...results
                    .map((e) => ResultView(
                          resultData: e,
                        ))
                    .toList(),
              ],
            )
          : ListView(
              children: widget.favorites!
                  .map((e) => ResultView(
                        resultData: e,
                      ))
                  .toList(),
            ),
    );
  }
}
