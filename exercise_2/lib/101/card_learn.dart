import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [_CustomCard(child: SizedBox(
      width: 100, height: 100, child: Text('Ali'), 
    ),),],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
 _CustomCard({
    super.key, required this.child
  });
  final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var card = Card(margin: ProjectMargins.cardMargin,
    color: Theme.of(context).colorScheme.error,
    child:child, shape: roundedRectangleBorder,);
    return card;
  }
}

class ProjectMargins{
  static const cardMargin =EdgeInsets.all(10);
}

//Borders
//StatiumBorder(), CircleBorder(), RoundedRectangleBorder(),