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
  View view = View.grid;

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
          children: [
            TapBarViewWidget(
              view: view,
            )
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

class TapBarViewWidget extends StatelessWidget {
  final View view;
  const TapBarViewWidget({
    super.key,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        SingleChildScrollView(
            child: Column(children: [
          CardListWidget(
            view: view,
          )
        ])),
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
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

class FiltersBarWidget extends StatefulWidget {
  final VoidCallback toggleFunction;

  const FiltersBarWidget({
    super.key,
    required this.toggleFunction,
  });

  @override
  State<FiltersBarWidget> createState() => _FiltersBarWidgetState();
}

class _FiltersBarWidgetState extends State<FiltersBarWidget> {
  List<String> option = [
    'Popular',
    'Newest',
    'Customer review',
    'Price: lowest to high',
    'Price: highest to low'
  ];
  String titleOption = 'Popular';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FiltersTabItemWidget(
            icon: Icons.filter_list_sharp, text: 'filter', onPressed: () {}),
        FiltersTabItemWidget(
            icon: Icons.swap_vert_outlined,
            text: titleOption,
            onPressed: () => showModalBottomSheet(
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
                          const Text('Sort by',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 30),
                          BottomSheetItem(option: option),
                        ],
                      ),
                    )).then((value) => setState(() => titleOption = value))),
        FiltersTabItemWidget(
            icon: Icons.apps_sharp,
            text: ' ',
            onPressed: widget.toggleFunction),
      ],
    );
  }
}

class BottomSheetItem extends StatefulWidget {
  final List<String> option;

  const BottomSheetItem({Key? key, required this.option}) : super(key: key);

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  static String selectOption = 'Popular';
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.option
            .map((element) => buildBottomSheetItem(context, element))
            .toList());
  }

  Widget buildBottomSheetItem(BuildContext context, String options) {
    final isSelected = selectOption == options;
    final selectedColor = isSelected ? Colors.red : null;
    final selectedTitle = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onDoubleTap: () => setState(() {
        Navigator.pop(context, options);
      }),
      onTap: () => setState(() {
        selectOption = options;
        print(selectOption);
      }),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 48,
          width: Size.infinite.width,
          color: selectedColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(options,
                style: TextStyle(
                    color: selectedTitle, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
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
          TabItemWidget(tabTitle: 'T-shirts'),
          TabItemWidget(tabTitle: 'Crop tops'),
          TabItemWidget(tabTitle: 'Sleeveless'),
          TabItemWidget(tabTitle: 'Shirts'),
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
  final View view;
  const CardListWidget({
    super.key,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: view == View.list
          ? const ListViewCardWidget()
          : const GridViewCardWidget(),
    );
  }
}

class GridViewCardWidget extends StatelessWidget {
  const GridViewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: womanCategoriesId.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 4,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageGridItemCardWidget(index: index),
                      const TitleGridItemCardWidget()
                    ])),
          );
        });
  }
}

class ImageGridItemCardWidget extends StatelessWidget {
  final int index;
  const ImageGridItemCardWidget({
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
              height: 170,
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

class ListViewCardWidget extends StatelessWidget {
  const ListViewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: womanCategoriesId.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Row(children: [
                      ImageListItemCardWidget(index: index),
                      const TitleListItemCardWidget()
                    ])),
                const FavoriteItemCardWidget(),
              ],
            ),
          );
        });
  }
}

class ImageListItemCardWidget extends StatelessWidget {
  const ImageListItemCardWidget({
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

class TitleListItemCardWidget extends StatelessWidget {
  const TitleListItemCardWidget({
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

enum View { list, grid }
