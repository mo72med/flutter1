import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  final String? hint;
  TextFieldWidget({super.key, required this.hint});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final validatorKey = GlobalKey<FormState>();
  bool iconLable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          color: Colors.white,
          child: Form(
            key: validatorKey,
            child: TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Write Your ${widget.hint}';
                  } else {
                    iconLable = true;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    validatorKey.currentState?.validate();
                    value.isEmpty ? iconLable = false : iconLable = true;
                  });
                },
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(25),
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Color(0xff9B9B9B)),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: iconLable == true
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : null,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0)),
                )),
          )),
    );
  }
}
