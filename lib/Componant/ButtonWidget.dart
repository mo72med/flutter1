import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool buttonBorder;
  final GestureTapCallback? ontap;
  final double width;
  Color color;
  ButtonWidget({
    required this.title,
    this.color = const Color(0xffDB3022),
    this.buttonBorder = false,
    this.width = double.infinity,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: buttonBorder ? Border.all(color: Colors.white) : null,
            borderRadius: BorderRadius.circular(20.0),
            color: color),
        width: width,
        height: 48.0,
        child: Center(
            child: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
