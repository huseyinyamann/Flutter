import 'package:exerccise_3/product/language/language_items.dart';
import 'package:flutter/material.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int counterCustom = 0;
  final welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _updateCounter,
      child: Text('$welcomeTitle $counterCustom'),
    );
  }
}
