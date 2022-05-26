import 'package:flutter/material.dart';

import 'custom_button.dart';

class Favorites extends StatefulWidget {
  final Function? onFavoriteSave;
  const Favorites({Key? key, this.onFavoriteSave}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Favorites",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomButton(
            onTap: widget.onFavoriteSave,
            iconData: Icons.add,
          )
        ],
      ),
    );
  }
}
