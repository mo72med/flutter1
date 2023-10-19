import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';

class ProductCardPage extends StatefulWidget {
  const ProductCardPage({super.key});

  @override
  State<ProductCardPage> createState() => _ProductCardPageState();
}

class _ProductCardPageState extends State<ProductCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackArrowWidget(ontap: () {}),
        centerTitle: true,
        title: const Text('Short dress', style: TextStyle(color: Colors.black)),
        elevation: 5,
        shadowColor: Colors.grey.shade50,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (_, i) => Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.75,
                      color: Colors.grey,
                    ),
                    itemCount: 3,
                    separatorBuilder: (_, i) => const SizedBox(
                      width: 3.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropListBottomSheetWidget(title: 'Size', onTap: () {}),
                      DropListBottomSheetWidget(title: 'Size', onTap: () {}),
                      const FavoriteItemCardWidget(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        trailing: const Text('\$19.99',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black)),
                        title: const Text('H&M',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black)),
                        onTap: () {},
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Short black dress'),
                              Row(
                                children: const [
                                  Icon(Icons.star,
                                      color: Color(0xffFFBA49), size: 14.0),
                                  Icon(Icons.star,
                                      color: Color(0xffFFBA49), size: 14.0),
                                  Icon(Icons.star,
                                      color: Color(0xffFFBA49), size: 14.0),
                                  Icon(Icons.star,
                                      color: Color(0xffFFBA49), size: 14.0),
                                  Icon(Icons.star,
                                      color: Color(0xffFFBA49), size: 14.0),
                                ],
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: Text(
                      textDirection: TextDirection.rtl,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      '''
              Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim
              '''),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonWidget(
                buttonBorder: true,
                width: 375.0,
                height: 48,
                title: 'ADD TO CART',
                ontap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropListBottomSheetWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  const DropListBottomSheetWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        width: 138.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.8),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteItemCardWidget extends StatelessWidget {
  const FavoriteItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36.0,
        width: 36.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 4.0,
                offset: const Offset(0, 2),
              )
            ]),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.grey,
          size: 24.0,
        ));
  }
}
