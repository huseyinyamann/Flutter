import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '*';
  bool _isSecure = true;
  int _animationDuration=500;

  void changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isSecure,
      obscuringCharacter: _obscureText,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'Password',
        suffix: _onVisibilityIcon(),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: () => changeSecure(),
      icon: AnimatedCrossFade(
          firstChild: Icon(Icons.visibility),
          secondChild: Icon(Icons.visibility_off,),
          crossFadeState:
              _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: _animationDuration)),
      // icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
    );
  }
}
