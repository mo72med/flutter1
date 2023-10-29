import 'package:flutter/material.dart';
import 'package:flutter1/Componant/ButtonWidget.dart';

import '../../Componant/BackArrowWidget.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  bool _checkBoxValue = false;
  bool _checkBoxValue2 = false;
  final bool _checkBoxValueSheetModel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        mini: true,
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
                            'Add new card',
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        BarWidget(labelTitle: 'Name on card'),
                        BarWidget(
                            labelTitle: 'Card number',
                            suffixWidget:
                                Image.asset('assets/images/mastercard.png')),
                        BarWidget(labelTitle: 'Expire Date'),
                        BarWidget(
                            labelTitle: 'CVV',
                            suffixWidget: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.help_outline,
                                color: Color(0xff9B9B9B),
                              ),
                            )),
                        const SizedBox(height: 10.0),
                        CheckBoxWidget(
                          checkBoxValue: _checkBoxValueSheetModel,
                        ),
                        ButtonWidget(
                          title: 'ADD CARD',
                          ontap: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                )),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment methods',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: .1,
        leading: BackArrowWidget(ontap: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Your payment cards',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/images/Card.png'),
            CheckboxListTile(
              title: const Text(
                'Use as default payment method',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkBoxValue,
              onChanged: (value) => setState(() => _checkBoxValue = value!),
              activeColor: const Color(0xff222222),
            ),
            Image.asset('assets/images/Card 2.png'),
            CheckboxListTile(
              title: const Text(
                'Use as default payment method',
                style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkBoxValue2,
              onChanged: (value) => setState(() => _checkBoxValue2 = value!),
              activeColor: const Color(0xff222222),
            ),
          ],
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
                labelStyle: const TextStyle(color: Color(0xff9B9B9B)),
                contentPadding: const EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}

class GreyBarWidget extends StatelessWidget {
  const GreyBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 6.0,
        alignment: Alignment.center,
        width: 60.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  bool checkBoxValue;
  CheckBoxWidget({super.key, required this.checkBoxValue});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Use as default payment method',
        style: TextStyle(
            color: Color(0xff222222),
            fontSize: 14.0,
            fontWeight: FontWeight.bold),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.checkBoxValue,
      onChanged: (value) => setState(() => widget.checkBoxValue = value!),
      activeColor: const Color(0xff222222),
    );
  }
}
