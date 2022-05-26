import 'package:flutter/material.dart';

import 'package:trestest/result_view.dart';

import 'custom_button.dart';
import 'funcs.dart';

class Results extends StatefulWidget {
  final String? searchFor;
  final List<ResultData> loadedResults;

  const Results({
    Key? key,
    this.searchFor = "All",
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
                child: Text(
                  widget.searchFor!,
                  style: const TextStyle(
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

