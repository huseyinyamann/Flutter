import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
 final projectPadding = ProjectPadding();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding Learn'),),

      body: Padding(
        padding: projectPadding.pagePadingVertical,
        child: Column(
          children: [
            Padding( padding: EdgeInsets.symmetric(horizontal: 10),
               child: Container(color: Colors.white, height: 100, )),
                Padding( padding: EdgeInsets.only(right: 10) + EdgeInsets.only(left: 10),
               child: Container(color: Colors.white, height: 100, )),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding{
  final pagePadingVertical =const EdgeInsets.symmetric(vertical: 10);
}