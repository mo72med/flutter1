import 'package:flutter/material.dart';

import '../../BackEndCategories/CategoriesBackEnd.dart';
import '../../Componant/ButtonWidget.dart';
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

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({
    super.key,
  });

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
                        itemBuilder: (_, i) => CardItemWidget(index: i),
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
  const CardItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageItemCardWidget(index: index),
              const TitleGridItemCardWidget()
            ]));
  }
}

class ImageItemCardWidget extends StatelessWidget {
  final int index;
  const ImageItemCardWidget({
    super.key,
    required this.index,
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
          const Positioned(
            bottom: 0.0,
            right: 0.0,
            child: FavoriteItemCardWidget(),
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
