import 'package:flutter/material.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../routes/router.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adding Shipping Address',
            style: TextStyle(
                color: Color(0xff222222),
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              BarWidget(labelTitle: 'Full name'),
              BarWidget(labelTitle: 'Address'),
              BarWidget(labelTitle: 'State/Province/Region'),
              BarWidget(labelTitle: 'Zip Code (Postal Code)'),
              BarWidget(
                  labelTitle: 'Country',
                  suffixWidget: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xff9B9B9B),
                      size: 16.0,
                    ),
                  )),
              const SizedBox(height: 40.0),
              ButtonWidget(
                title: 'SAVE ADDRESS',
                ontap: () => Navigator.push(
                    context,
                    onGenerateRoute(
                        const RouteSettings(name: successPageRoute))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  final String labelTitle;
  Widget? suffixWidget;
  BarWidget({super.key, required this.labelTitle, this.suffixWidget});

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
