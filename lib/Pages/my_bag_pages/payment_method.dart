import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  bool _checkBoxValue = false;
  bool _checkBoxValue2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        mini: true,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment methods',
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Your payment cards',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/images/Card.png'),
            CheckboxListTile(
              title: const Text(
                'Use as default payment method',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkBoxValue,
              onChanged: (value) => setState(() => _checkBoxValue = value!),
              activeColor: const Color(0xff222222),
            ),
            Image.asset('assets/images/Card 2.png'),
            CheckboxListTile(
              title: const Text(
                'Use as default payment method',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkBoxValue2,
              onChanged: (value) => setState(() => _checkBoxValue2 = value!),
              activeColor: const Color(0xff222222),
            ),
          ],
        ),
      ),
    );
  }
}
