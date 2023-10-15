import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool buttonBorder;
  final GestureTapCallback? ontap;
  final double width;
  final double height;
  final Color colorText;
  final Color colorBorder;
  Color color;
  ButtonWidget({
    required this.title,
    this.color = const Color(0xffDB3022),
    this.buttonBorder = false,
    this.width = double.infinity,
    this.height = 48.0,
    this.colorText = Colors.white,
    this.colorBorder = Colors.white,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: buttonBorder ? Border.all(color: colorBorder) : null,
            borderRadius: BorderRadius.circular(20.0),
            color: color),
        width: width,
        height: height,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
