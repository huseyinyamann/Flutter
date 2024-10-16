import 'package:exerccise_3/core/random_image.dart';
import 'package:flutter/material.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final _cardHeight =50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 4,
           child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: 
                RandomImage(),
                bottom: _cardHeight/2,
                ),
                Positioned(
                height: _cardHeight,
                width: 200,
                bottom: 0,
                 child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(),
                 ))
            ],
          ),
          ),
          Spacer(flex: 6,)
        ],
      ),
    );
  }
}