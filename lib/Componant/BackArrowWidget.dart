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
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 24.0,
      ),
      color: Colors.black,
    );
  }
}
