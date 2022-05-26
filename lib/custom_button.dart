import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? iconData;
  final double? size;
  final Color? color;
  final Function? onTap;
  const CustomButton({
    this.size,
    this.iconData,
    this.onTap,
    Key? key, this.color,
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
            child: Icon(
              iconData,
              color: color,
            )),
      ),
    );
  }
}
