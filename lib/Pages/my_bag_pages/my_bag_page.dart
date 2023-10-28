import 'package:flutter/material.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fefd),
      appBar: AppBar(
          backgroundColor: const Color(0xfff5fefd),
          elevation: 0.0,
          actions: const [
            Icon(
              Icons.search,
              size: 30.5,
              color: Color(0xff222222),
            ),
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: TitleAppBarWidget())),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ListItemWidget(),
              SizedBox(height: 15.0),
              PromoCodeBarWidget(),
              SizedBox(height: 15.0),
              TotalAmountBarWidget(),
              SizedBox(height: 50.0),
              CheckOutBarWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOutBarWidget extends StatelessWidget {
  const CheckOutBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48.0,
      width: 400.0,
      decoration: BoxDecoration(
          color: const Color(0xffDB3022),
          borderRadius: BorderRadius.circular(30.0)),
      child: const Text('CHECK OUT',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          )),
    );
  }
}

class TotalAmountBarWidget extends StatelessWidget {
  const TotalAmountBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Total amount:',
              style: TextStyle(
                  color: Color(0xff9B9B9B),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            ),
            Text(
              '125\$',
              style: TextStyle(
                  color: Color(0xff222222),
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCodeBarWidget extends StatelessWidget {
  const PromoCodeBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Container(
              height: 40.0,
              width: 400.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 1.0,
                        offset: const Offset(-2, 2),
                        blurRadius: 10.0)
                  ],
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(
                        15.0,
                      ),
                      right: Radius.circular(50.0))),
              child: TextFormField(
                cursorColor: const Color(0xff9B9B9B),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                    border: InputBorder.none,
                    hintText: 'Enter your promo code'),
              )),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
                  context: context,
                  builder: (BuildContext context) => Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 20, left: 15.0, right: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 6.0,
                                alignment: Alignment.center,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            SizedBox(
                              height: 40,
                              child: Stack(
                                children: [
                                  Container(
                                      height: 40.0,
                                      width: 400.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.5),
                                                spreadRadius: 1.0,
                                                offset: const Offset(-2, 2),
                                                blurRadius: 10.0)
                                          ],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(
                                                    15.0,
                                                  ),
                                                  right:
                                                      Radius.circular(50.0))),
                                      child: TextFormField(
                                        cursorColor: const Color(0xff9B9B9B),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 15.0, bottom: 10.0),
                                            border: InputBorder.none,
                                            hintText: 'Enter your promo code'),
                                      )),
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                        maxRadius: 20.0,
                                        backgroundColor: Color(0xff222222),
                                        child: Icon(
                                          Icons.arrow_forward_sharp,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text('Your Promo Codes',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xff222222),
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15.0),
                            const ListItemPromoCodeWidget()
                          ],
                        ),
                      )),
              child: const CircleAvatar(
                maxRadius: 20.0,
                backgroundColor: Color(0xff222222),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItemPromoCodeWidget extends StatelessWidget {
  const ListItemPromoCodeWidget({
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
          height: 106.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                          title: const Text('Main Title',
                              style: TextStyle(fontSize: 16)),
                          subtitle: Row(children: const [
                            Text('Color:Black', style: TextStyle(fontSize: 11)),
                            Text('Size:L', style: TextStyle(fontSize: 11))
                          ]),
                          trailing: const Text('6 days remaining',
                              style: TextStyle(fontSize: 11))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 32.0,
                              width: 96.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xffDB3022)),
                              child: const Text(
                                'Apply',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text('Main Title',
                            style: TextStyle(fontSize: 16)),
                        subtitle: Row(children: const [
                          Text('Color:Black', style: TextStyle(fontSize: 11)),
                          Text(
                            'Size:L',
                            style: TextStyle(fontSize: 11),
                          )
                        ]),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(-2, 5),
                                            spreadRadius: 0.25,
                                            blurRadius: 6)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(60.0)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black26,
                                    size: 15.0,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text('1'),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(-2, 5),
                                            spreadRadius: 0.25,
                                            blurRadius: 6)
                                      ],
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(60.0)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            const Text('43\$'),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAppBarWidget extends StatelessWidget {
  const TitleAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(children: const [
              Text(
                'My Bag',
                style: TextStyle(
                    fontSize: 34.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
