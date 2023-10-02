import 'package:flutter/material.dart';
import '../../BackEndCategories/CategoriesBackEnd.dart';
import '../../Componant/BackArrowWidget.dart';

class CategoriesPages extends StatefulWidget {
  const CategoriesPages({super.key});

  @override
  State<CategoriesPages> createState() => _CategoriesPagesState();
}

class _CategoriesPagesState extends State<CategoriesPages> {
  int _onSelectedItem = 0;
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xfff5fefd),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: BackArrowWidget(ontap: () {}),
          title: const TitleWidget(),
          centerTitle: true,
          actions: const [SearchButtonWidget()],
        ),
        body: Column(
          children: const [
            TabBarWidget(),
            TapBarViewWidget(),
          ],
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

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Categories', style: TextStyle(color: Colors.black));
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
            child: Column(
          children: const [
            MainCardWidget(),
            CardListWidget(),
          ],
        )),
        Container(color: Colors.red),
        Container(color: Colors.green),
      ]),
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
            return CardItemWidget(index: index);
          }),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  final int index;

  const CardItemWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 8.0, left: 8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(womanCategoriesId[index].title,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.asset(
                'assets/images/${womanCategoriesId[index].image}',
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        decoration: BoxDecoration(
            color: const Color(0xffDB3022),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('SUMMER SALES',
                  style: TextStyle(color: Colors.white, fontSize: 24.0)),
              Text('Up to 50% off',
                  style: TextStyle(color: Colors.white, fontSize: 14.0)),
            ]),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        color: Colors.white,
        child: const TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xffDB3022),
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                icon: Text('Woman',
                    style: TextStyle(color: Colors.black, fontSize: 16.0)),
              ),
              Tab(
                  icon: Text('Men',
                      style: TextStyle(color: Colors.black, fontSize: 16.0))),
              Tab(
                  icon: Text('Kids',
                      style: TextStyle(color: Colors.black, fontSize: 16.0))),
            ]),
      ),
    );
  }
}
