import 'package:flutter/material.dart';

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

class CustomButton extends StatelessWidget {
  final iconData;
  final double? size;
  final Function? onTap;
  const CustomButton({
    this.size,
    this.iconData,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 50,
      width: size ?? 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black26,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              onTap!();
            },
            child: Icon(iconData)),
      ),
    );
  }
}
