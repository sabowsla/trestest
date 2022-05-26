import 'package:flutter/material.dart';

import 'package:trestest/favorites.dart';

import 'funcs.dart';


class Results extends StatefulWidget {
  final String? searchFor;
  final List<ResultData> loadedResults;

  const Results({
    Key? key,
    this.searchFor = "Happy Hours",
    this.loadedResults = const [],
  }) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List<Widget> buildResults() {
    List<Widget> widgets = [];
    for (var element in widget.loadedResults) {
      widgets.add(ResultView(
        resultData: element,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text(
                  "Happy Hours",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomButton(
                size: 40,
                iconData: Icons.delete_outline,
              ),
            ],
          ),
        ),
        ...buildResults()
      ],
    ));
  }
}

class ResultView extends StatelessWidget {
  final ResultData? resultData;
  const ResultView({Key? key, this.resultData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_horiz_outlined,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                      resultData!.url!,
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
               Expanded(
                child: Text(
              resultData!.title!,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
