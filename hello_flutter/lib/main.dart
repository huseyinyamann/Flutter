import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text(
          'Hello Flutter',
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  ));
}
