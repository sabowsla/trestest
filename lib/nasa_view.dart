import 'package:flutter/material.dart';
import 'package:trestest/favorites_view.dart';
import 'package:trestest/header.dart';
import 'package:trestest/home_view.dart';
import 'package:trestest/nav_bar.dart';
import 'package:trestest/results.dart';

import 'calendar_view.dart';
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
  String searchFor = "All";
  List<ResultData> loadedResults = [];
  List<ResultData> favorites = [];
  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController(initialPage: 0);

  void onSearch(String search) async {
    loadedResults = await getGifs(search + " Restaurants");

    setState(() {
      searchFor = search + " Restaurants";
    });
  }

  void onPageChange(String page) {
    var curve = Curves.ease;
    var duration = const Duration(milliseconds: 600);
    setState(() {
      if (page == "Home") {
        pageController.animateToPage(
          0,
          duration: duration,
          curve: curve,
        );
      }
      if (page == "Calendar") {
        pageController.animateToPage(
          1,
          duration: duration,
          curve: curve,
        );
      }
      if (page == "Search") {
        pageController.animateToPage(
          2,
          duration: duration,
          curve: curve,
        );
      }
      if (page == "Favoritos") {
        pageController.animateToPage(
          3,
          duration: duration,
          curve: curve,
        );
      }
    });
  }

  void onFavoriteSave() {
    setState(() {
      favorites.addAll(loadedResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                const HomeView(),
                const CalendarView(),
                Column(
                  children: [
                    Header(nasaLogo: nasaLogo),
                    Favorites(
                      onFavoriteSave: onFavoriteSave,
                    ),
                    Categories(onChange: onSearch),
                    Results(
                      loadedResults: loadedResults,
                      searchFor: searchFor,
                    ),
                  ],
                ),
                FavoritesView(favorites: favorites),
              ],
            ),
          ),
          CustomBottonNavBar(
            onChange: onPageChange,
          ),
        ],
      ),
    );
  }
}
