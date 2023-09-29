import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? Hint;
  TextFieldWidget({super.key, required this.controller, required this.Hint});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          color: Colors.white,
          child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(25),
                border: InputBorder.none,
                hintText: widget.Hint,
                hintStyle: const TextStyle(color: Color(0xff9B9B9B)),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0)),
              ))),
    );
  }
}
