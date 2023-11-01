import 'package:flutter/material.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../BackEndCategories/CategoriesBackEnd.dart';
import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../routes/router.dart';
import '../decision_page.dart';

class Categories2Pages extends StatefulWidget {
  const Categories2Pages({super.key});

  @override
  State<Categories2Pages> createState() => _Categories2PagesState();
}

class _Categories2PagesState extends State<Categories2Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarPage(onSelectedItem: 1),
      backgroundColor: const Color(0xfff5fefd),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackArrowWidget(ontap: () {}),
        title: const TitleHeaderWidget(),
        centerTitle: true,
        actions: const [SearchButtonWidget()],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
          child: Column(children: [
            ViewAllItemWidget(onTap: () {}),
            const ChooseCategoryTitleWidget(),
            CardListWidget(
              onPress: () => Navigator.push(context,
                  onGenerateRoute(const RouteSettings(name: catalogPageRoute))),
            ),
          ])),
    );
  }
}

class ViewAllItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ViewAllItemWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(ontap: onTap, title: 'VIEW ALL ITEMS');
  }
}

class ChooseCategoryTitleWidget extends StatelessWidget {
  const ChooseCategoryTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: Size.infinite.width,
        height: 48.0,
        child: Row(children: const [
          Text('Choose category',
              style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        ]),
      ),
    );
  }
}

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Categories', style: TextStyle(color: Colors.black));
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
  final VoidCallback onPress;
  const CardListWidget({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return CardItemWidget(
              index: index,
              onPress: onPress,
            );
          }),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  final int? index;
  final VoidCallback onPress;

  const CardItemWidget({
    this.index,
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          width: Size.infinite.width,
          height: 48.0,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(chooseCategory[index!].categoryTitle,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0)),
            ),
          ]),
        ),
      ),
    );
  }
}
