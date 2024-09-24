import 'package:flutter/material.dart';

class CustomWidgetLearnView extends StatelessWidget {
  const CustomWidgetLearnView({super.key});
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CustomFootButton(title: 'Food'),
          ],
        ),
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class CustomFootButton extends StatelessWidget {
  const CustomFootButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _ColorsUtility().redColor,
        shape: const StadiumBorder(),
      ),
      onPressed: () {},
      child: Center(
        child: Padding(
          padding: _PaddingUtility().normalPadding,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _ColorsUtility().whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}

class _PaddingUtility {
  final normalPadding = const EdgeInsets.all(8.0);
  final normal2xPadding = const EdgeInsets.all(8.0);
}
