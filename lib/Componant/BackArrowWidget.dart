import 'package:flutter/material.dart';

class BackArrowWidget extends StatelessWidget {
  final VoidCallback ontap;
  const BackArrowWidget({
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ontap,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 24.0,
      ),
      color: Colors.black,
    );
  }
}
