import 'package:flutter/material.dart';
import 'package:flutter1/Componant/ButtonWidget.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../routes/router.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const ShippingAddressCardWidget(),
            const SizedBox(height: 30.0),
            const PaymentCardWidget(),
            const SizedBox(height: 30.0),
            const DeliveryMethodWidget(),
            const SizedBox(height: 30.0),
            Column(
              children: const [
                RowMoneyBarWidget(title: 'Order:', moneyTitle: '112\$'),
                RowMoneyBarWidget(title: 'Delivery:', moneyTitle: '15\$'),
                RowMoneyBarWidget(title: 'Summary:', moneyTitle: '127\$'),
              ],
            ),
            const SizedBox(height: 50.0),
            ButtonWidget(title: 'SUBMIT ORDER', ontap: () {})
          ],
        ),
      ),
    );
  }
}

class RowMoneyBarWidget extends StatelessWidget {
  final String? moneyTitle;
  final String? title;
  const RowMoneyBarWidget({
    super.key,
    this.moneyTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!,
              style: const TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0)),
          Text(moneyTitle!,
              style: const TextStyle(color: Color(0xff222222), fontSize: 16.0)),
        ],
      ),
    );
  }
}

class DeliveryMethodWidget extends StatelessWidget {
  const DeliveryMethodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery method',
          style: TextStyle(
              color: Color(0xff222222),
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/images/fedex.png', width: 110),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/images/usps.png', width: 110),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/images/dhl.png', width: 110),
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Payment',
              style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  onGenerateRoute(
                      const RouteSettings(name: paymentMethodPageRoute))),
              child: const Text('Change',
                  style: TextStyle(color: Colors.red, fontSize: 14.0)),
            )
          ],
        ),
        Row(
          children: [
            Image.asset('assets/images/mastercard.png'),
            const SizedBox(width: 20.0),
            const Text('**** **** **** 3947',
                style: TextStyle(color: Color(0xff222222), fontSize: 14.0)),
          ],
        ),
      ],
    );
  }
}

class ShippingAddressCardWidget extends StatelessWidget {
  const ShippingAddressCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Shipping address',
            style: TextStyle(
                color: Color(0xff222222),
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20.0),
        Container(
          height: 108.0,
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jane Doe',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              onGenerateRoute(const RouteSettings(
                                  name: shoppingAddressPageRoute))),
                          child: const Text(
                            'Change',
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ))
                    ]),
                const Text(
                  '''3 New bridge Court \nChino Hills, CA 91709, United States''',
                  style: TextStyle(fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
