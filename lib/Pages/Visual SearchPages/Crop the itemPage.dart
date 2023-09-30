import 'package:flutter/material.dart';

class CropTheItemPage extends StatelessWidget {
  const CropTheItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Crop the item',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: const [ImageWidget(), SearchButtonWidget()],
      ),
    );
  }
}

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Color(0xffDB3022),
              radius: 30.0,
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Size.infinite.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Image.asset(
          'assets/images/cropTheItem.png',
          fit: BoxFit.cover,
        ));
  }
}
