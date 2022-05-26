import 'package:flutter/material.dart';
import 'package:trestest/header.dart';
import 'package:trestest/home_view.dart';
import 'package:trestest/nav_bar.dart';
import 'package:trestest/results.dart';

import 'categories.dart';
import 'favorites.dart';
import 'funcs.dart';

class NasaView extends StatefulWidget {
  const NasaView({Key? key}) : super(key: key);

  @override
  State<NasaView> createState() => _NasaViewState();
}

class _NasaViewState extends State<NasaView> {
  var nasaLogo = "assets/nasa.png";
  String searchFor = "Happy Hours";
  List<ResultData> loadedResults = [];
  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController(initialPage: 0);

  void onSearch(String search) async {
    loadedResults = await getGifs("Restaurants");
    print(loadedResults);
    setState(() {
      searchFor = search;
    });
  }

  void onPageChange(String page) {
    var curve = Curves.ease;
    var duration = const Duration(milliseconds: 600);
    setState(() {
      if (page == "Home") {
        pageController.animateToPage(
          1,
          duration: duration,
          curve: curve,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView(
            children: [
              const HomeView(),
              Column(
                children: [
                  Header(nasaLogo: nasaLogo),
                  const Favorites(),
                  Categories(onChange: onSearch),
                  Results(loadedResults: loadedResults),
                ],
              )
            ],
          ),
           CustomBottonNavBar(
            onChange: onPageChange,
          ),
        ],
      ),
    );
  }
}
