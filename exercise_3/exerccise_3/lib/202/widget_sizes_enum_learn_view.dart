import 'package:flutter/material.dart';

class WidgetSizesEnumLearnView extends StatefulWidget {
  const WidgetSizesEnumLearnView({super.key});

  @override
  State<WidgetSizesEnumLearnView> createState() =>
      _WidgetSizesEnumLearnViewState();
}

class _WidgetSizesEnumLearnViewState extends State<WidgetSizesEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: SizedBox(
          height: WidgetSizes.normalCardHeight.value(),
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidhedSizesExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 25;
    }
  }
}
