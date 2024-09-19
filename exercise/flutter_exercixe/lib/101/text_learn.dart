import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  final keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    final String name='Veli';
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(('Welcome $name'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.red,
          )
          ),
          Text(keys.welcomme),
          ], 
        ),
      ),
    );
}  
}

class ProjectStyles{
  static TextStyle welcomeStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
}

class ProjectKeys{
  final String welcomme = 'Merhaba';
}