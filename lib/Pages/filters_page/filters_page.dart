import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final List<ColorContainer> _colorBubbleWidget = const [
    ColorContainer(activeColor: Colors.black),
    ColorContainer(activeColor: Color(0xffF6F6F6)),
    ColorContainer(activeColor: Color(0xffB82222)),
    ColorContainer(activeColor: Color(0xffBEA9A9)),
    ColorContainer(activeColor: Color(0xffE2BB8D)),
    ColorContainer(activeColor: Color(0xff151867)),
  ];
  final List<SizeContainer> _sizesWidget = const [
    SizeContainer(sizes: 'XS'),
    SizeContainer(sizes: 'S'),
    SizeContainer(sizes: 'M'),
    SizeContainer(sizes: 'L'),
    SizeContainer(sizes: 'XL'),
  ];
  final List<CategoryContainer> _categoryTitle = const [
    CategoryContainer(categoryTitle: 'All'),
    CategoryContainer(categoryTitle: 'Women'),
    CategoryContainer(categoryTitle: 'Men'),
    CategoryContainer(categoryTitle: 'Boys'),
    CategoryContainer(categoryTitle: 'Girls'),
  ];

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
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const FiltersTypeTitleWidget(title: 'Price range'),
          const PriceRangeContainer(),
          const FiltersTypeTitleWidget(title: 'Colors'),
          ContainerCategoryWidget(listCategoryWidget: _colorBubbleWidget),
          const FiltersTypeTitleWidget(title: 'Sizes'),
          ContainerCategoryWidget(listCategoryWidget: _sizesWidget),
          const FiltersTypeTitleWidget(title: 'Colors'),
          ContainerCategoryWidget(listCategoryWidget: _categoryTitle),
          const FiltersTypeTitleWidget(title: 'Brand'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'adidas Originals, Jack & Jones, s.Oliver',
                  style: TextStyle(color: Color(0xff9B9B9B)),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 100.0)
        ])),
        const BottomButton(),
      ]),
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

class PriceRangeContainer extends StatefulWidget {
  const PriceRangeContainer({super.key});

  @override
  State<PriceRangeContainer> createState() => _PriceRangeContainerState();
}

class _PriceRangeContainerState extends State<PriceRangeContainer> {
  double _startSliderValue = 78;
  double _endSliderValue = 143;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 2.0,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0.0, 1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_startSliderValue.toInt()}\$',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Text(
                      '${_endSliderValue.toInt()}\$',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 3.0,
                  inactiveTickMarkColor: Color(0xff9B9B9B),
                  inactiveTrackColor: Color(0xff9B9B9B),
                  activeTickMarkColor: Color(0xffDB3022),
                  activeTrackColor: Color(0xffDB3022),
                  thumbColor: Color(0xffDB3022),
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 12.0,
                  ),
                ),
                child: RangeSlider(
                  labels: RangeLabels(
                      _startSliderValue.toString(), _endSliderValue.toString()),
                  onChanged: (values) => setState(() {
                    _startSliderValue = values.start;
                    _endSliderValue = values.end;
                  }),
                  values: RangeValues(_startSliderValue, _endSliderValue),
                  min: 0.0,
                  max: 250.0,
                  divisions: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorContainer extends StatefulWidget {
  final Color activeColor;
  const ColorContainer({
    super.key,
    required this.activeColor,
  });

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  bool switchBorder = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => setState(() => switchBorder = !switchBorder),
        child: Container(
          alignment: Alignment.center,
          height: 44.0,
          width: 44.0,
          decoration: BoxDecoration(
              border: Border.all(
                color:
                    switchBorder ? const Color(0xffDB3022) : Colors.transparent,
                width: 1,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(70.0)),
          child: Container(
            height: 36.0,
            width: 36.0,
            decoration: BoxDecoration(
                color: widget.activeColor,
                borderRadius: BorderRadius.circular(70.0)),
          ),
        ),
      ),
    );
  }
}

class SizeContainer extends StatefulWidget {
  final String sizes;
  const SizeContainer({super.key, required this.sizes});

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  bool switchBorder = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => switchBorder = !switchBorder),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
        child: Container(
          alignment: Alignment.center,
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey, width: 1),
            color: switchBorder ? const Color(0xffDB3022) : Colors.transparent,
          ),
          child: Text(
            widget.sizes,
            style: TextStyle(
                color: switchBorder ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatefulWidget {
  final String categoryTitle;
  const CategoryContainer({super.key, required this.categoryTitle});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  bool switchBorder = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
      child: GestureDetector(
        onTap: () => setState(() => switchBorder = !switchBorder),
        child: Container(
          alignment: Alignment.center,
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey, width: 1),
            color: switchBorder ? const Color(0xffDB3022) : Colors.transparent,
          ),
          child: Text(
            widget.categoryTitle,
            style: TextStyle(
                color: switchBorder ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}

class ContainerCategoryWidget extends StatelessWidget {
  const ContainerCategoryWidget({
    super.key,
    required List<Widget> listCategoryWidget,
  }) : _listCategoryWidget = listCategoryWidget;

  final List<Widget> _listCategoryWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 2.0,
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(0.0, 1))
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Wrap(children: _listCategoryWidget),
            )));
  }
}

class FiltersTypeTitleWidget extends StatelessWidget {
  final String title;
  const FiltersTypeTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
}
