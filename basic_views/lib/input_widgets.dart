import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class InputWidgets extends StatefulWidget {
  @override
  State<InputWidgets> createState() => _InputWidgetsState();
}

class _InputWidgetsState extends State<InputWidgets> {
  final nameController = TextEditingController();
  bool isCheck = false;
  Gender gender = Gender.male;
  final countries = [
    'Australia',
    'Bandladesh'
        'Canada',
    'Denmark'
        'England',
    'France'
  ];
  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widgets'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(label: Text('Enter your name')),
            ),
            ElevatedButton(
                onPressed: () {
                  print(nameController.text);
                },
                child: Text('OK')),
            Row(
              children: [
                Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    }),
                Text('Flutter'),
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Male'),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            DropdownButton<String>(
              hint: Text('Select your country'),
                value: country,
                items: countries.map((e) =>DropdownMenuItem<String>(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value){
                  setState(() {
                    country =value;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
