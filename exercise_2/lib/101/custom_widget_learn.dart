import 'package:flutter/material.dart';

class CustomWidgetLearnView extends StatelessWidget with _ColorsUtility {
  CustomWidgetLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Food',
              style: Theme.of(context).textTheme.bodyMedium.copyWith(
                    color: redColor,
                  ),
            )),
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
}
