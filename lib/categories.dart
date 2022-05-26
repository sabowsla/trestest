import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final Function? onChange;
  const Categories({
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Happy Hours", "Drinks", "Beer", "Etc"];
  String selected = "All";

  void select(String newVal) {
    setState(() {
      selected = newVal;
      widget.onChange!(newVal);
    });
  }

  List<Widget> buildCategories() {
    return categories.map((e) {
      bool isSelected = e == selected;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          color: isSelected
              ? const Color.fromARGB(255, 238, 127, 61)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              select(e);
            },
            child: Text(
              e,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(children: buildCategories()),
          )
        ],
      ),
    );
  }
}
