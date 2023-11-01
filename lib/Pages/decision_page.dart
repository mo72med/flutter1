import 'package:flutter/material.dart';
import 'package:flutter1/routes/router.dart';

import '../routes/router_names.dart';

class BottomNavigationBarPage extends StatefulWidget {
  int onSelectedItem;
  BottomNavigationBarPage({super.key, required this.onSelectedItem});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
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
    return setState(() {
      widget.onSelectedItem = index;
      switch (widget.onSelectedItem) {
        case 0:
          Navigator.push(context,
              onGenerateRoute(const RouteSettings(name: mainPageRoute)));
          break;
        case 1:
          Navigator.push(context,
              onGenerateRoute(const RouteSettings(name: categoriesPagesRoute)));
          break;
        case 2:
          Navigator.push(context,
              onGenerateRoute(const RouteSettings(name: myBagPageRoute)));
          break;
        case 3:
          Navigator.push(context,
              onGenerateRoute(const RouteSettings(name: mainPageRoute)));
          break;
        case 4:
          Navigator.push(context,
              onGenerateRoute(const RouteSettings(name: myProfilePageRoute)));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomBarItems,
      onTap: _onItemTapped,
      currentIndex: widget.onSelectedItem,
      selectedItemColor: const Color(0xffDB3022),
      unselectedItemColor: Colors.grey,
      iconSize: 35.0,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      showUnselectedLabels: true,
    );
  }
}
