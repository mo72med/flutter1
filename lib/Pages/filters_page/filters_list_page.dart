import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';

class FiltersListPage extends StatefulWidget {
  const FiltersListPage({super.key});

  @override
  State<FiltersListPage> createState() => _FiltersListPageState();
}

class _FiltersListPageState extends State<FiltersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackArrowWidget(ontap: () {}),
          centerTitle: true,
          title: const Text('Filters', style: TextStyle(color: Colors.black)),
          elevation: 5,
          shadowColor: Colors.grey.shade50),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                child: Center(
                  child: Container(
                    height: 40,
                    width: 343,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              blurRadius: 2.0,
                              blurStyle: BlurStyle.normal,
                              offset: const Offset(0.0, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const CheckBoxTile(checkBoxTitle: 'adidas'),
              const CheckBoxTile(checkBoxTitle: 'adidas Originals'),
              const CheckBoxTile(checkBoxTitle: 'Blend'),
              const CheckBoxTile(checkBoxTitle: 'Boutique Moschino'),
              const CheckBoxTile(checkBoxTitle: 'Champion'),
              const CheckBoxTile(checkBoxTitle: 'Diesel'),
              const CheckBoxTile(checkBoxTitle: 'Jack & Jones'),
              const CheckBoxTile(checkBoxTitle: 'Naf Naf'),
              const CheckBoxTile(checkBoxTitle: 'Red Valentino'),
              const CheckBoxTile(checkBoxTitle: 's.Oliver'),
            ],
          ),
          const BottomButton()
        ],
      ),
    );
  }
}

class CheckBoxTile extends StatefulWidget {
  final String checkBoxTitle;
  const CheckBoxTile({super.key, required this.checkBoxTitle});

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * .98,
        child: CheckboxListTile(
            activeColor: const Color(0xffDB3022),
            title: Text(widget.checkBoxTitle,
                style: TextStyle(
                  color: _isChecked
                      ? const Color(0xffDB3022)
                      : const Color(0xff222222),
                  fontSize: 16.0,
                )),
            value: _isChecked,
            onChanged: (bool? value) => setState(() => _isChecked = value!)),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        color: Colors.white,
        height: 104,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              color: Colors.white,
              buttonBorder: true,
              colorText: Colors.black,
              colorBorder: Colors.black,
              width: 160.0,
              height: 36,
              title: 'Discard',
              ontap: () {},
            ),
            ButtonWidget(
              buttonBorder: true,
              width: 160.0,
              height: 36,
              title: 'Apply',
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
