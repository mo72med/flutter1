import 'package:flutter/material.dart';
import 'package:flutter1/Componant/ButtonWidget.dart';

import '../../Componant/BackArrowWidget.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xfff5fefd),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackArrowWidget(ontap: () {}),
          centerTitle: true,
          actions: const [SearchButtonWidget()],
          elevation: 0.5,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(100.0), child: TapBarWidget()),
        ),
        body: TabBarView(children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, i) => const CardItemListWidget(),
          ),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ]),
      ),
    );
  }
}

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppBarTitleWidget(),
          TabBarListWidget(),
        ],
      ),
    );
  }
}

class CardItemListWidget extends StatelessWidget {
  const CardItemListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 164.0,
        width: 400.0,
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Order №1947034',
                      style:
                          TextStyle(color: Color(0xff222222), fontSize: 16.0)),
                  Text('05-12-2019',
                      style:
                          TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0)),
                ],
              ),
              Row(
                children: const [
                  Text('Tracking number:',
                      style:
                          TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0)),
                  Text('IW3475453455',
                      style:
                          TextStyle(color: Color(0xff222222), fontSize: 16.0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('Quantity:',
                          style: TextStyle(
                              color: Color(0xff9B9B9B), fontSize: 14.0)),
                      Text('3',
                          style: TextStyle(
                              color: Color(0xff222222), fontSize: 16.0)),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Total Amount:',
                          style: TextStyle(
                              color: Color(0xff9B9B9B), fontSize: 14.0)),
                      Text('112\$',
                          style: TextStyle(
                              color: Color(0xff222222), fontSize: 16.0)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    width: 98.0,
                    height: 36.0,
                    title: 'Details',
                    ontap: () {},
                    buttonBorder: true,
                    color: Colors.white,
                    colorText: Colors.black,
                    colorBorder: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Delivered',
                        style: TextStyle(color: Colors.green, fontSize: 14.0)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 24.0,
        ));
  }
}

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'My Orders',
          style: TextStyle(
              fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TabBarListWidget extends StatelessWidget {
  const TabBarListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(
        isScrollable: true,
        indicator: BoxDecoration(),
        labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
        tabs: [
          TabItemWidget(tabTitle: 'Delivered'),
          TabItemWidget(tabTitle: 'Processing'),
          TabItemWidget(tabTitle: 'Cancelled'),
        ]);
  }
}

class TabItemWidget extends StatelessWidget {
  final String tabTitle;
  const TabItemWidget({
    super.key,
    required this.tabTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 30.0,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
        child: Center(child: Text(tabTitle)),
      ),
    );
  }
}
