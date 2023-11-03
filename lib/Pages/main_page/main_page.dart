import 'package:flutter/material.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../BackEndCategories/CategoriesBackEnd.dart';
import '../../Componant/ButtonWidget.dart';
import '../../routes/router.dart';
import '../decision_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarPage(onSelectedItem: 0),
      body: const MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({
    super.key,
  });

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final List<String> _size = ['XS', 'S', 'M', 'L', 'XL'];
  String initialTitle = 'Size';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                  height: 536,
                  width: MediaQuery.of(context).size.width,
                  'assets/images/twogirles.png',
                  fit: BoxFit.cover),
              const Positioned(
                  top: 334,
                  left: 15,
                  child: Text(
                    'Fashion \nsale',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0),
                  )),
              Positioned(
                top: 468,
                left: 10,
                child: ButtonWidget(
                  title: 'check',
                  ontap: () {},
                  width: 160,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, i) => const SizedBox(height: 15.0),
            itemCount: 2,
            itemBuilder: (_, i) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleCategory[i].mainTitle,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 34.0),
                          ),
                          Text(
                            titleCategory[i].subTitle,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11.0),
                          )
                        ],
                      ),
                      Text(
                        titleCategory[i].buttonTitle,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) => CardItemWidget(
                            index: i,
                            onTap: () => showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                )),
                                context: context,
                                builder: (BuildContext context) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 6.0,
                                            alignment: Alignment.center,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text('Select Size',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 30),
                                          BottomSheetItem(
                                              title: _size,
                                              tileTitle: 'Size info')
                                        ],
                                      ),
                                    )).then((value) =>
                                setState(() => initialTitle = value))),
                        separatorBuilder: (_, i) => const SizedBox(width: 10.0),
                        itemCount: 3),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  final int index;
  final GestureTapCallback? onTap;
  const CardItemWidget({
    super.key,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageItemCardWidget(index: index, onTap: onTap),
              const TitleGridItemCardWidget()
            ]));
  }
}

class ImageItemCardWidget extends StatelessWidget {
  final int index;
  final GestureTapCallback? onTap;
  const ImageItemCardWidget({
    super.key,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/${womanCategoriesId[index].image}',
              fit: BoxFit.cover,
              height: 184,
              width: MediaQuery.of(context).size.width * .38,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: GestureDetector(
                onTap: onTap, child: const FavoriteItemCardWidget()),
          )
        ],
      ),
    );
  }
}

class TitleGridItemCardWidget extends StatelessWidget {
  const TitleGridItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.star, size: 11.0, color: Colors.amber),
          Text('Sub Data',
              style: TextStyle(color: Colors.grey, fontSize: 11.0)),
          Text('Main Data',
              style: TextStyle(color: Colors.black, fontSize: 16.0)),
          Text('10\$', style: TextStyle(color: Colors.black, fontSize: 14.0)),
        ],
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
          Icons.favorite,
          color: Color(0xffDB3022),
          size: 20.0,
        ));
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
            title: 'ADD TO FAVORITES',
            ontap: () {
              Navigator.push(
                  context,
                  onGenerateRoute(
                      const RouteSettings(name: favoritesListPageRoute)));
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
