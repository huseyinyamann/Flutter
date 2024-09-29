// Bir ekran olucak
// Bu ekranda 3 button ve bunlara basınca renk degisimi olucak
//secili olan button button selected ıcon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({super.key, required this.initialColor});
  final Color? initialColor;
  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    inspect(widget); //adamsın inspect adamsın dart !! objeyi direkt yazdırır
    print('DidUpdate çalıştı' +
        '${oldWidget.initialColor == widget.initialColor}');
//oldWidget.initialColor != widget.initialColor &&
    if (widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  void initState() {
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(
              label: 'Red', icon: _ColorContainer(color: Colors.red)),
          BottomNavigationBarItem(
              label: 'Yellow', icon: _ColorContainer(color: Colors.yellow)),
          BottomNavigationBarItem(
              icon: _ColorContainer(color: Colors.blue), label: 'Blue'),
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key,
    required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      color: color,
    );
  }
}
