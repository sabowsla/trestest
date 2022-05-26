import 'package:flutter/material.dart';

class CustomBottonNavBar extends StatefulWidget {
  final Function? onChange;
  const CustomBottonNavBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  String onRoute = "Favoritos";
  void onChange(String newRoute) {
    setState(() {
      onRoute = newRoute;
      widget.onChange!(newRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomNavIcon(
            icon: "assets/home.png",
            name: "Home",
            onRoute: onRoute,
            onChange: onChange,
          ),
          CustomNavIcon(
            icon: "assets/calendar.png",
            name: "Calendar",
            onRoute: onRoute,
            onChange: onChange,
          ),
          CustomNavIcon(
            icon: "assets/search.png",
            name: "Search",
            onRoute: onRoute,
            onChange: onChange,
          ),
          CustomNavIcon(
            icon: "assets/favorites.png",
            name: "Favoritos",
            onRoute: onRoute,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}

class CustomNavIcon extends StatelessWidget {
  final Function? onChange;
  final String name;
  final String icon;
  final String onRoute;
  const CustomNavIcon({
    Key? key,
    this.onChange,
    required this.name,
    required this.icon,
    required this.onRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration500 = Duration(
      milliseconds: 500,
    );
    const duration200 = Duration(
      milliseconds: 200,
    );
    bool selected = name == onRoute;
    return InkWell(
      onTap: () {
        onChange!(name);
      },
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              icon,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          AnimatedContainer(
            duration: duration500,
            width: selected ? 70 : 20,
            child: AnimatedDefaultTextStyle(
              duration: duration200,
              style: TextStyle(
                color: selected ? Colors.black : Colors.white,
              ),
              child: Text(
                name,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
