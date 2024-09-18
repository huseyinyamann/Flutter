import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(1000, (index) => 'Item${index + 1}');
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (content, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: index.isEven ? Colors.grey : Colors.grey[300],
            title: Text('Item ${items[index]}'),
            subtitle: Text('This is a subtitle ${index + 1}'),
          ),
        ),
      ),
    );
  }
}
