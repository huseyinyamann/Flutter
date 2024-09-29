import 'package:exerccise_3/product/counter_hello_button.dart';
import 'package:exerccise_3/product/language/language_items.dart';
import 'package:flutter/material.dart';

class StatefullLearnView extends StatefulWidget {
  const StatefullLearnView({super.key});

  @override
  State<StatefullLearnView> createState() => _StatefullLearnViewState();
}

class _StatefullLearnViewState extends State<StatefullLearnView> {
  int countValue = 0;

  void incrementValue() {
    countValue++;
  }

  void deincrementValue() {
    countValue--;
  }

  void _updateCounter(bool isIncrement) {
    setState(() {
      if (isIncrement)
        incrementValue();
      else
        deincrementValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcomeTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '$countValue',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.amber),
            ),
          ),
          const Placeholder(),
          const CounterHelloButton(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _deincrementButton(),
          )
        ],
      ),
    );
  }

  FloatingActionButton _deincrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: Icon(Icons.remove),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }
}
