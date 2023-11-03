import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../routes/router.dart';
import '../../routes/router_names.dart';

class ProductCardPage extends StatefulWidget {
  const ProductCardPage({super.key});

  @override
  State<ProductCardPage> createState() => _ProductCardPageState();
}

class _ProductCardPageState extends State<ProductCardPage> {
  final List<String> _size = ['XS', 'S', 'M', 'L', 'XL'];
  final Map<String, dynamic> _color = {
    'Black': Colors.black,
    'white': Colors.white,
    'Red': Colors.red
  };

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
              icon: const Icon(Icons.share, color: Colors.black))
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
                    itemCount: 3,
                    itemBuilder: (_, i) => Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: Colors.grey),
                    separatorBuilder: (_, i) => const SizedBox(width: 3.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropListBottomSheetWidget(
                          titleList: _size, initialTitle: 'Size'),
                      DropListBottomSheetWidget(
                          titleList: _color.keys.toList(),
                          initialTitle: 'Color'),
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
                const SizedBox(height: 100.0)
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
                ontap: () => Navigator.push(
                    context,
                    onGenerateRoute(
                        const RouteSettings(name: ratingAndReviewPageRoute))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropListBottomSheetWidget extends StatefulWidget {
  final List titleList;
  late final String initialTitle;
  DropListBottomSheetWidget({
    super.key,
    required this.titleList,
    required this.initialTitle,
  });

  @override
  State<DropListBottomSheetWidget> createState() =>
      _DropListBottomSheetWidgetState();
}

class _DropListBottomSheetWidgetState extends State<DropListBottomSheetWidget> {
  late String? initialTitle = widget.initialTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
          context: context,
          builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.0,
                      alignment: Alignment.center,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    const SizedBox(height: 10.0),
                    const Text('Select Size',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    BottomSheetItem(
                        title: widget.titleList, tileTitle: 'Size info')
                  ],
                ),
              )).then((value) => setState(() => initialTitle = value)),
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
              initialTitle == null
                  ? Text(widget.initialTitle)
                  : Text('$initialTitle'),
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

class SizeContainer extends StatefulWidget {
  final String sizes;
  const SizeContainer({super.key, required this.sizes});

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  bool switchBorder = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => switchBorder = !switchBorder),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
        child: Container(
          alignment: Alignment.center,
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey, width: 1),
            color: switchBorder ? const Color(0xffDB3022) : Colors.transparent,
          ),
          child: Text(
            widget.sizes,
            style: TextStyle(
                color: switchBorder ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}

class BottomSheetItem extends StatefulWidget {
  final List title;
  final String tileTitle;
  const BottomSheetItem(
      {Key? key, required this.title, required this.tileTitle})
      : super(key: key);

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  static String selectTitle = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
            children: widget.title
                .map((element) => buildBottomSheetItem(context, element))
                .toList()),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.tileTitle,
                  style: const TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios, size: 16))
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ButtonWidget(
            buttonBorder: true,
            width: 375.0,
            height: 48,
            title: 'ADD TO CART',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  Widget buildBottomSheetItem(BuildContext context, String sizes) {
    final isSelected = selectTitle == sizes;
    final selectedColor = isSelected ? Colors.red : null;
    final selectedTitle = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onDoubleTap: () => setState(() {
        Navigator.pop(context, sizes);
      }),
      onTap: () => setState(() => selectTitle = sizes),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 40.0,
            width: 100.0,
            decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(sizes,
                  style: TextStyle(
                      color: selectedTitle, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
