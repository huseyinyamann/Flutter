import 'package:flutter/material.dart';

class MyTodoFile extends StatefulWidget {
  const MyTodoFile({super.key});

  @override
  State<MyTodoFile> createState() => _MyTodoFileState();
}

class _MyTodoFileState extends State<MyTodoFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        
      ),
    );
  }
}
