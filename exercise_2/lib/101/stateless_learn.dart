import 'package:flutter/material.dart';

class StatelessLearnView extends StatelessWidget{
   final String title = 'title';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!'),
      ),
      body: Column(
        children: [
         TitleTextWidget(title: title),
         TitleTextWidget(title: title),
          _emptyBox(),
         TitleTextWidget(title: title),
          _emptyBox(),
          _CustomContainer(), 
        ],
              ),

    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10,); //method çıkartma
}

//_CustomContainer '_' bu sayfaya özel anlamı - file private
class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

//dışarıdan parametre alabilmek
class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(), 
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}