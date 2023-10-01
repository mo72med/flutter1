import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../Componant/BackArrowWidget.dart';

class TakingPhotoPage extends StatefulWidget {
  const TakingPhotoPage({super.key});

  @override
  State<TakingPhotoPage> createState() => _TakingPhotoPageState();
}

class _TakingPhotoPageState extends State<TakingPhotoPage> {
  File fileImage = File("");
  void getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.camera);
    fileImage = File(file!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: BackArrowWidget(ontap: () {}),
        centerTitle: true,
        title: const Text(
          'Search by taking a photo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          fileImage.path.isNotEmpty == true
              ? Visibility(
                  visible: fileImage.path.isNotEmpty,
                  child: Image.file(
                    fileImage,
                    fit: BoxFit.cover,
                  ))
              : const ImageWidget(),
          // const ImageWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.flash_on, size: 30.0),
                InkWell(
                  onTap: getImageFromCamera,
                  child: const CircleAvatar(
                    backgroundColor: Color(0xffDB3022),
                    radius: 30.0,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                const Icon(Icons.repeat, size: 30.0),
              ],
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
          'assets/images/visualSearch.png',
          fit: BoxFit.cover,
        ));
  }
}
