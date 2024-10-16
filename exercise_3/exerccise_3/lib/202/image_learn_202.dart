import 'package:flutter/material.dart';

class ImageLearn202View extends StatefulWidget {
  const ImageLearn202View({super.key});

  @override
  State<ImageLearn202View> createState() => _ImageLearn202ViewState();
}

class _ImageLearn202ViewState extends State<ImageLearn202View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagesEnum.hoays_pic.toWidget() ,
    );
  }
}

enum ImagesEnum {
// ignore: constant_identifier_names
  hoays_pic
}

extension ImagePathsExtension on ImagesEnum {
  Widget toWidget() {
    return Image.asset('assets/png/$name.png');
  }
}
