import 'package:basic_views/counter_app.dart';
import 'package:basic_views/grid_view_example.dart';
import 'package:basic_views/input_widgets.dart';
import 'package:basic_views/list_view_example.dart';
import 'package:basic_views/my_todo_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewExample()));
              },
              child: Text('Go To The ListView Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridViewExample()));
              },
              child: Text('Go To The GridView Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CounterApp()));
              },
              child: Text('Counter App Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputWidgets()));
              },
              child: Text('Input Widgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyTodoFile()));
              },
              child: Text('Todo Page'),
            )
          ],
        ),
      ),
    );
  }
}
