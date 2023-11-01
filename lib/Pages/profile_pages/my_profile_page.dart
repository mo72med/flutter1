import 'package:flutter/material.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../routes/router.dart';
import '../decision_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarPage(onSelectedItem: 4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5fefd),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.search, size: 24.0, color: Color(0xff222222)),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: MyProfileHeaderWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      height: 64.0,
                      width: 64.0,
                      color: Colors.grey,
                    )),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Matilda Brown',
                      style:
                          TextStyle(color: Color(0xff222222), fontSize: 18.0),
                    ),
                    Text(
                      'matildabrown@mail.com',
                      style:
                          TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15.0),
            ListItemProfileWidget(
              title: 'My orders',
              subtitle: 'Already have 12 orders',
              onTap: () => Navigator.push(context,
                  onGenerateRoute(const RouteSettings(name: myOrderPageRoute))),
            ),
            ListItemProfileWidget(
                title: 'Shipping addresses',
                subtitle: '3 ddresses',
                onTap: () {}),
            ListItemProfileWidget(
                title: 'Payment methods', subtitle: 'Visa  **34', onTap: () {}),
            ListItemProfileWidget(
                title: 'Promocodes',
                subtitle: 'You have special promocodess',
                onTap: () {}),
            ListItemProfileWidget(
                title: 'My reviews',
                subtitle: 'Reviews for 4 items',
                onTap: () {}),
            ListItemProfileWidget(
              title: 'Settings',
              subtitle: 'Notifications, password',
              onTap: () => Navigator.push(context,
                  onGenerateRoute(const RouteSettings(name: settingPageRoute))),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemProfileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback onTap;

  const ListItemProfileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 72.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(color: Color(0xff222222), fontSize: 16.0),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Color(0xff9B9B9B), fontSize: 11.0),
          ),
          contentPadding: const EdgeInsets.only(left: 8.0),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 12.0,
              )),
        ),
      ),
    );
  }
}

class MyProfileHeaderWidget extends StatelessWidget {
  const MyProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(children: const [
              Text(
                'My profile',
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
