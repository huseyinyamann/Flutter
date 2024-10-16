import 'package:exerccise_3/202/package/launch_manager.dart';
import 'package:flutter/material.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => PackageLearnViewState();
}

class PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'data',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        launchMixin('');
      }),
    );
  }
}
