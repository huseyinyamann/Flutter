import 'package:exerccise_3/core/random_image.dart';
import 'package:flutter/material.dart';

class ListTileLearnView extends StatelessWidget {
  const ListTileLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: RandomImage(),
                  onTap: () {},
                  subtitle: Text('How do you use card'),
                  leading: Icon(Icons.money),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
