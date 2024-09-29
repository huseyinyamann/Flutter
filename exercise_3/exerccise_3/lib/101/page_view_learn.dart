import 'package:flutter/material.dart';

class PageViewLearnView extends StatefulWidget {
  const PageViewLearnView({super.key});

  @override
  State<PageViewLearnView> createState() => _PageViewLearnViewState();
}

class _PageViewLearnViewState extends State<PageViewLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        
      ),
    );
  }
}
