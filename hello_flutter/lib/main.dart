import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const url =
    'https://www.snow-forecast.com/system/images/3290/medium/Kandersteg.jpg';

const sundarban =
'''The Sundarbans mangrove forest, one of the largest such forests in the world (140,000 ha), lies on the delta of the Ganges, Brahmaputra and Meghna rivers on the Bay of Bengal. It is adjacent to the border of India’s Sundarbans World Heritage site inscribed in 1987. The site is intersected by a complex network of tidal waterways, mudflats and small islands of salt-tolerant mangrove forests, and presents an excellent example of ongoing ecological processes. The area is known for its wide range of fauna, including 260 bird species, the Bengal tiger and other threatened species such as the estuarine crocodile and the Indian python.''';

void main() {
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _imageSection(),
        _headerSection(),
        _navigationSection(),
        _bodySection()
            ],
          ),
        ),
      );
  }

  Padding _bodySection() {
    return Padding(padding: const EdgeInsets.all(16.0),
        child: Text(sundarban),);
  }

  Padding _navigationSection() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GenerateNavigationButton(Icons.share, 'SHARE'),
            GenerateNavigationButton(Icons.route, 'ROUTE'),
          GenerateNavigationButton(Icons.favorite, 'FAVORITE'),
          ],
        ),
      );
  }

   Widget GenerateNavigationButton(IconData _icon, String title){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _icon,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Padding _headerSection() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Sundarbans',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Khulna Division Bangadesh',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text('9.5'),
          ],
        ),
      );
  }

  Image _imageSection() {
    return Image.network(
        url,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
  }
}
