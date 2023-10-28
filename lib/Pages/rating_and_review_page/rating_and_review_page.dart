import 'dart:core';

import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';

class RatingAndReview extends StatefulWidget {
  const RatingAndReview({super.key});

  @override
  State<RatingAndReview> createState() => _RatingAndReviewState();
}

class _RatingAndReviewState extends State<RatingAndReview> {
  final String _rating = '4.3';
  bool checkBoxValue = false;
  final List<Widget> _starRate = const [
    Icon(
      Icons.star_border,
      size: 36,
      color: Colors.grey,
    ),
    Icon(Icons.star_border, size: 36),
    Icon(Icons.star_border, size: 36),
    Icon(Icons.star_border, size: 36),
    Icon(Icons.star_border, size: 36),
  ];
  List<Widget> star() {
    List<Widget> data = [];
    for (int i = 0; i < 5; i++) {
      data = [];
      for (int j = i; j < 5; j++) {
        data.add(const Icon(Icons.star, color: Color(0xffFFBA49), size: 14.0));
      }
      print(data);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffDB3022),
        onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
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
                      const Text('What is you rate?',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _starRate),
                      const SizedBox(height: 15.0),
                      const SizedBox(
                        width: 277.0,
                        child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            '''Please share your opinion about the product''',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black)),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        height: 148.0,
                        width: 327.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 104.0,
                              width: 104.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 52.0,
                                    width: 52.0,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffDB3022),
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: const Icon(Icons.camera_alt_rounded),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Add your photos',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: Colors.black,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        alignment: Alignment.center,
                        height: 48.0,
                        width: 343.0,
                        decoration: BoxDecoration(
                            color: const Color(0xffDB3022),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Text('SEND REVIEW',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )),
        label: Row(
          children: const [
            Icon(
              Icons.edit,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 8.0),
            Text('Write a review',
                style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackArrowWidget(ontap: () {}),
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.grey.shade50),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating&Reviews',
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_rating,
                        style: const TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold)),
                    const Text('23 ratings',
                        style: TextStyle(
                            fontSize: 14.0, color: Color(0xff9B9B9B))),
                  ],
                ),
                Wrap(
                  children: star(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('8 reviews',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 170,
                  child: CheckboxListTile(
                    activeColor: Colors.black,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxValue,
                    onChanged: (bool? newValue) =>
                        setState(() => checkBoxValue = newValue!),
                    title: const Text('With photo',
                        style: TextStyle(fontSize: 14.0)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (i, _) => Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 370,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (i, _) => const SizedBox(height: 8.0),
                  itemCount: 3),
            )
          ],
        ),
      ),
    );
  }
}
