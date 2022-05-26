import 'package:flutter/material.dart';
import 'package:trestest/favorites.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.nasaLogo,
  }) : super(key: key);

  final String nasaLogo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            nasaLogo,
            width: 100,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const CustomButton(
                size: 40,
                iconData: Icons.notifications_outlined,
              ),
              Container(
                width: 10,
              ),
              const CustomButton(
                size: 40,
                iconData: Icons.settings_outlined,
              )
            ],
          ),
        ),
      ],
    );
  }
}
