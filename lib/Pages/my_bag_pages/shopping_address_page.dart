import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';

class ShoppingAddressPage extends StatelessWidget {
  const ShoppingAddressPage({super.key});

  final bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment methods',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, i) =>
                      ShippingAddressCardWidget(checkBoxValue: _checkBoxValue),
                  separatorBuilder: (_, i) => const SizedBox(height: 10.0),
                  itemCount: 3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        mini: true,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ShippingAddressCardWidget extends StatefulWidget {
  bool checkBoxValue;
  ShippingAddressCardWidget({
    super.key,
    required this.checkBoxValue,
  });

  @override
  State<ShippingAddressCardWidget> createState() =>
      _ShippingAddressCardWidgetState();
}

class _ShippingAddressCardWidgetState extends State<ShippingAddressCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Container(
          height: 140,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 1.0,
                    offset: const Offset(-2, 2),
                    blurRadius: 5.0)
              ],
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Jane Doe',
                                style: TextStyle(fontSize: 14.0)),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Edit',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0)))
                          ]),
                      const Text(
                          '''3 New bridge Court \nChino Hills, CA 91709, United States''',
                          style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Use as default payment method',
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: widget.checkBoxValue,
                  onChanged: (value) =>
                      setState(() => widget.checkBoxValue = value!),
                  activeColor: const Color(0xff222222),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
