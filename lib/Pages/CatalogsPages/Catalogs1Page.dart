import 'package:flutter/material.dart';

import '../../BackEndCategories/CategoriesBackEnd.dart';
import '../../Componant/BackArrowWidget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int _onSelectedItem = 0;
  View view = View.list;

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Bag'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Favorites'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined), label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _onSelectedItem = index;
      print(_onSelectedItem);
    });
  }

  void _onMenuTapped() {
    setState(() {
      view == View.list ? view = View.grid : view = View.list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xfff5fefd),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackArrowWidget(ontap: () {}),
          centerTitle: true,
          actions: const [SearchButtonWidget()],
          elevation: 0.5,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(140.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppBarTitleWidget(),
                    const TabBarListWidget(),
                    FiltersBarWidget(toggleFunction: _onMenuTapped),
                  ],
                ),
              )),
        ),
        body: Column(
          children: [TapBarViewWidget()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomBarItems,
          onTap: _onItemTapped,
          currentIndex: _onSelectedItem,
          selectedItemColor: const Color(0xffDB3022),
          unselectedItemColor: Colors.grey,
          iconSize: 35.0,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

class TapBarViewWidget extends StatelessWidget {
  const TapBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        SingleChildScrollView(
            child: Column(children: const [CardListWidget()])),
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.green),
      ]),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final VoidCallback toggleFunction;
  const HeaderWidget({
    super.key,
    required this.toggleFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppBarTitleWidget(),
          const TabBarListWidget(),
          FiltersBarWidget(toggleFunction: toggleFunction),
        ],
      ),
    );
  }
}

class FiltersBarWidget extends StatelessWidget {
  final VoidCallback toggleFunction;
  const FiltersBarWidget({
    super.key,
    required this.toggleFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FiltersTabItemWidget(
            icon: Icons.filter_list_sharp, text: 'filter', onPressed: () {}),
        FiltersTabItemWidget(
            icon: Icons.swap_vert_outlined,
            text: 'Price: lowest to high',
            onPressed: () {}),
        FiltersTabItemWidget(
            icon: Icons.apps_sharp, text: ' ', onPressed: toggleFunction),
      ],
    );
  }
}

class FiltersTabItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const FiltersTabItemWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(icon), const SizedBox(width: 5.0), Text(text)],
            ),
          ),
        ));
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
          TabItemWidget(TabTitle: 'T-shirts'),
          TabItemWidget(TabTitle: 'Crop tops'),
          TabItemWidget(TabTitle: 'Sleeveless'),
          TabItemWidget(TabTitle: 'Shirts'),
        ]);
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
          'Women’s tops',
          style: TextStyle(
              fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TabItemWidget extends StatelessWidget {
  final String TabTitle;
  const TabItemWidget({
    super.key,
    required this.TabTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 30.0,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
        child: Center(child: Text(TabTitle)),
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

class CardListWidget extends StatelessWidget {
  const CardListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
          itemCount: womanCategoriesId.length,
          itemBuilder: (context, index) {
            return CardItemListWidget(index: index);
          }),
    );
  }
}

class CardItemListWidget extends StatelessWidget {
  final int index;

  const CardItemListWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(children: [
                ImageItemCardWidget(index: index),
                const TitleItemCardWidget()
              ])),
          const FavoriteItemCardWidget(),
        ],
      ),
    );
  }
}

class ImageItemCardWidget extends StatelessWidget {
  const ImageItemCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
        child: Image.asset(
          'assets/images/${womanCategoriesId[index].image}',
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
    );
  }
}

class TitleItemCardWidget extends StatelessWidget {
  const TitleItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Main Data',
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            Text('Sub Data',
                style: TextStyle(color: Colors.grey, fontSize: 11.0)),
            Icon(Icons.star, size: 11.0, color: Colors.amber),
            Text('10\$', style: TextStyle(color: Colors.black, fontSize: 14.0)),
          ],
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
                offset: Offset(0, 2),
              )
            ]),
        child: const Icon(
          Icons.favorite,
          color: Color(0xffDB3022),
          size: 20.0,
        ));
  }
}

enum View { list, grid }
