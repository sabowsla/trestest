import 'package:flutter/material.dart';
import 'package:trestest/funcs.dart';
import 'package:trestest/results.dart';

class FavoritesView extends StatefulWidget {
  final List<ResultData>? favorites;
  const FavoritesView({Key? key, this.favorites}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: widget.favorites!.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    child: const Text(
                      "Nothing here yet",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 60,
                    ),
                  ),
                )
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
