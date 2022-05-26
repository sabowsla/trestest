import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

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
        children: const [
          Text(
            "Favorites",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomButton(
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
  const CustomButton({
    this.size,
    this.iconData,
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
      child: Icon(iconData),
    );
  }
}
