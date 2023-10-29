import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Order Details',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24.0,
                color: Color(0xff222222),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Order №1947034',
                    style: TextStyle(color: Color(0xff222222), fontSize: 16.0)),
                Text('05-12-2019',
                    style: TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text('Tracking number:',
                        style: TextStyle(
                            color: Color(0xff9B9B9B), fontSize: 14.0)),
                    Text('IW3475453455',
                        style: TextStyle(
                            color: Color(0xff222222), fontSize: 16.0)),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Delivered',
                      style: TextStyle(color: Colors.green, fontSize: 14.0)),
                )
              ],
            ),
            const ListItemWidget(),
            const SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order information',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff222222))),
                const OrderInfoItemWidget(
                    mainTitle: 'Shipping Address:',
                    subTitle:
                        '3 Newbridge Court ,Chino Hills,\nCA 91709, United States'),
                OrderInfoItemWidget(
                    mainTitle: 'Payment method:',
                    haveIcon: true,
                    widgetData: Image.asset('assets/images/mastercard.png'),
                    subTitle: '**** **** **** 3947'),
                const OrderInfoItemWidget(
                    mainTitle: 'Delivery method:',
                    subTitle: 'FedEx, 3 days, 15\$'),
                const OrderInfoItemWidget(
                    mainTitle: 'Discount:',
                    subTitle: '10%, Personal promo code'),
                const OrderInfoItemWidget(
                    mainTitle: 'Total Amount:', subTitle: '133\$'),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      width: 160.0,
                      height: 36.0,
                      title: 'Details',
                      ontap: () {},
                      buttonBorder: true,
                      color: Colors.white,
                      colorText: Colors.black,
                      colorBorder: Colors.black,
                    ),
                    ButtonWidget(
                      width: 160.0,
                      height: 36.0,
                      title: 'Leave feedback',
                      ontap: () {},
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderInfoItemWidget extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final bool haveIcon;
  final Widget? widgetData;
  const OrderInfoItemWidget({
    super.key,
    required this.mainTitle,
    required this.subTitle,
    this.haveIcon = false,
    this.widgetData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Text(mainTitle,
              style: const TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0)),
        ),
        Row(
          children: [
            haveIcon ? widgetData! : Container(),
            const SizedBox(width: 10.0),
            Text(subTitle,
                style:
                    const TextStyle(color: Color(0xff222222), fontSize: 14.0)),
          ],
        ),
      ]),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (_, i) => const SizedBox(height: 15.0),
        itemBuilder: (_, i) => Container(
          height: 110.0,
          width: 100.0,
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
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0))),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Pullover',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff222222),
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5.0),
                        const Text('Mango',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Color(0xff9B9B9B),
                            )),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Color:',
                                style: TextStyle(
                                    color: Color(0xff9B9B9B), fontSize: 11.0),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Grey',
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 11.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            RichText(
                              text: const TextSpan(
                                text: 'Size:',
                                style: TextStyle(
                                    color: Color(0xff9B9B9B), fontSize: 11.0),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'L',
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 11.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Units:',
                                style: TextStyle(
                                    color: Color(0xff9B9B9B), fontSize: 11.0),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '1',
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 11.0),
                                  ),
                                ],
                              ),
                            ),
                            const Text('51\$',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff222222),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
