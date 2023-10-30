import 'package:flutter/material.dart';

import 'Pages/my_bag_pages/payment_method.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymentMethodPage(),
    );
  }
}
