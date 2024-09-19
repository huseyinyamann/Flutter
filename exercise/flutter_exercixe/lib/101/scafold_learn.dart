import 'package:flutter/material.dart';

class ScafoldLearnView extends StatelessWidget {
  const ScafoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scafold Sample'),
      ),
      body: Text('Merhaba'),
      backgroundColor: Colors.red,
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: (){showModalBottomSheet(context: context, builder: (context) => Container(
        height: 200,
      ));},),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: 'sa'),
        BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: 'sa'),
      ]),
    );
  }
}