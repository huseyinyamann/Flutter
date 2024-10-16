import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        color: Colors.amber
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(fontSize: 25, color: _lightColor._textColor),
          ),
      colorScheme: const ColorScheme.light(),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
            onPrimary: Colors.purple, onSecondary: _lightColor.blueMania),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: Colors.green),
        fillColor: WidgetStateProperty.all(Colors.green),
      ),
    );
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 31, 29, 29);
  final Color blueMania = const Color.fromARGB(95, 188, 248, 1);
}
