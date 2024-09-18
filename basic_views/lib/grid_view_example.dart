import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate((100), (index) => 'Item ${index + 1}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Example'),
      ),
      
    );
  }
}
