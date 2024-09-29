import 'package:flutter/material.dart';

class TextFieldLearnView extends StatefulWidget {
  const TextFieldLearnView({super.key});

  @override
  State<TextFieldLearnView> createState() => _TextFieldLearnViewState();
}

class _TextFieldLearnViewState extends State<TextFieldLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        maxLength: 20,
        buildCounter: (BuildContext context,
            {int? currentLength, bool? isFocused, int? maxLength}) {
          return _animatedContainer(currentLength);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(),
          hintText: 'Mail',
          labelText: 'Mail',
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
          duration: Duration(seconds: 1),
          key: UniqueKey(),
          height: 10,
          width: 10.0 * (currentLength ?? 0),
            color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
        );
  }
}
