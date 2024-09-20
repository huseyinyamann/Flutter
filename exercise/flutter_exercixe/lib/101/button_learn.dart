import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }

              return Colors.yellow;
            })),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Data'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.abc),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
                child: Text(
                  'Place Bild',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Borders
//CircleBorders(), RoundedRectangleBorder()