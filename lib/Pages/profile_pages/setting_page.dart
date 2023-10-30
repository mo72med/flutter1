import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../my_bag_pages/payment_method.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  final bool _switchValue1 = false;
  final bool _switchValue2 = false;
  final bool _switchValue3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackArrowWidget(ontap: () {}),
        centerTitle: true,
        actions: const [SearchButtonWidget()],
        elevation: 0.0,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(80.0), child: AppBarTitleWidget()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BarWidget(labelTitle: 'Full name'),
              BarWidget(labelTitle: 'Date of Birth'),
              const PasswordWidget(),
              const Text('Notifications',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff222222),
                      fontWeight: FontWeight.bold)),
              NotificationWidget(switchValue: _switchValue1, title: 'Sales'),
              NotificationWidget(
                  switchValue: _switchValue2, title: 'New arrivals'),
              NotificationWidget(
                  switchValue: _switchValue3, title: 'Delivery status changes'),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff222222),
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                    context: context,
                    builder: (BuildContext context) => Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 20, left: 15.0, right: 15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GreyBarWidget(),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Center(
                                      child: Text(
                                    'Password Change',
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                BarWidget(labelTitle: 'Old Password'),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                              'Forgot Password?  ',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xff9B9B9B))))
                                    ]),
                                BarWidget(labelTitle: 'New Password'),
                                BarWidget(labelTitle: 'Repeat New Password'),
                                const SizedBox(height: 20.0),
                                ButtonWidget(
                                    title: 'SAVE PASSWORD',
                                    ontap: () => Navigator.pop(context)),
                                const SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                        )),
                child: const Text('Change',
                    style:
                        TextStyle(fontSize: 14.0, color: Color(0xff9B9B9B)))),
          ],
        ),
        BarWidget(labelTitle: 'Password', obscureText: true),
      ],
    );
  }
}

class NotificationWidget extends StatefulWidget {
  bool switchValue;
  final String title;
  NotificationWidget({
    super.key,
    required this.switchValue,
    required this.title,
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        activeColor: Colors.green,
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xff222222),
          ),
        ),
        value: widget.switchValue,
        onChanged: (value) => setState(() => widget.switchValue = value));
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

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: const [
          Text(
            'Settings',
            style: TextStyle(
                fontSize: 34.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  final String labelTitle;
  Widget? suffixWidget;
  bool? obscureText;
  BarWidget(
      {super.key,
      required this.labelTitle,
      this.suffixWidget,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: 64.0,
          width: 400.0,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 1.0,
                    offset: const Offset(-2, 2),
                    blurRadius: 10.0)
              ],
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: TextFormField(
              obscureText: obscureText!,
              cursorColor: const Color(0xff9B9B9B),
              decoration: InputDecoration(
                suffixIcon: suffixWidget,
                label: Text(labelTitle),
                labelStyle:
                    const TextStyle(color: Color(0xff9B9B9B), fontSize: 14.0),
                contentPadding: const EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
