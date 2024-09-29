import 'package:exerccise_3/demo/color_demos_view.dart';
import 'package:flutter/material.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _changeBackgroundColor,
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: ColorDemosView(initialColor: _backgroundColor),
          ),
        ],
      ),
    );
  }

  void _changeBackgroundColor() {
            setState(
              () {
                _backgroundColor = Colors.pink;
                print('Color temizlendi');
              },
            );
          }
}
