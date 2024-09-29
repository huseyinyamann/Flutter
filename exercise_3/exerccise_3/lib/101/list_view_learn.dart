import 'package:flutter/material.dart';

class ListViewLearnView extends StatefulWidget {
  const ListViewLearnView({super.key});

  @override
  State<ListViewLearnView> createState() => _ListViewLearnViewState();
}

class _ListViewLearnViewState extends State<ListViewLearnView> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 1,
            ),
          )
        ],
      ),
    ));
  }
}
