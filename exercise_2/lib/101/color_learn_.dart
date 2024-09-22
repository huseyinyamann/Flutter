import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
ColorItems colorItems  = ColorItems();
  @override
  Widget build(BuildContext context) {
    final colorItems = ColorItems();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: colorItems.tallPopy,
          ),
          Container(
color: colorItems.malibu,
          ),
        ],
      ),
    );
  }
}

class ColorItems{
final Color tallPopy = const Color.fromRGBO(196, 67, 39, 1);
final Color malibu = const Color(0xff5BD6F5);

}