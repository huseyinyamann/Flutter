import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ImageItems{
final String applex ="applex";
}

class PngImage extends StatelessWidget{
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context){
  return Image.asset(_nameWithPath, fit:BoxFit.cover);
  }
  String get _nameWithPath => 'assets/png/$name.png';
}