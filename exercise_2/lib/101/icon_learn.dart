import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
final iconSizes = IconSizes();
final iconColor =IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Hello',
      ),),
      body: Column(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message),
          color: iconColor.froly,
          iconSize: iconSizes.iconSmall,),
          IconButton(onPressed: (){}, icon: Icon(Icons.message),
          color: iconColor.froly,
          iconSize: iconSizes.iconSmall,),
          IconButton(onPressed: (){}, icon: Icon(Icons.message),
          color: iconColor.froly,
          iconSize: iconSizes.iconSmall,),
        ],
      ),
    );
  }
}

class IconSizes{
  final double iconSmall = 40;
}

class IconColors{
  final Color froly = const Color(0xffED617A);
}