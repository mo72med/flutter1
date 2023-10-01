import 'package:flutter/material.dart';
import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';

class VisualSearchPage extends StatelessWidget {
  const VisualSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: BackArrowWidget(ontap: () {}),
        centerTitle: true,
        title: const Text(
          'Visual search',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: Size.infinite.width,
            color: Colors.white,
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Search for an outfit by taking a photo or uploading an image',
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  const SizedBox(height: 30.0),
                  ButtonWidget(
                    title: 'TAKE A PHOTO',
                    buttonBorder: false,
                    ontap: () {},
                  ),
                  const SizedBox(height: 15.0),
                  ButtonWidget(
                    title: 'UPLOAD AN IMAGE',
                    color: Colors.transparent,
                    buttonBorder: true,
                    ontap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
