import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFFFF0000); // Vermelho
  static const Color secondaryColor = Color(0xFFff5e00); // Laranja
  static const Color backgroundColor = Color(0xFFffffff); // Branco
  static const Color textColor = Color(0xFF000000); // Preto

  // Tema claro
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: _textTheme(textColor),
      elevatedButtonTheme: _elevatedButtonTheme(primaryColor, backgroundColor),
      inputDecorationTheme: _inputDecorationTheme(textColor),
    );
  }

  // Tema escuro
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.black,
      textTheme: _textTheme(Colors.white),
      elevatedButtonTheme: _elevatedButtonTheme(primaryColor, backgroundColor),
      inputDecorationTheme: _inputDecorationTheme(Colors.white),
    );
  }

  // Método para o TextTheme
  static TextTheme _textTheme(Color color) {
    return TextTheme(
      bodyText1: TextStyle(color: color),
      bodyText2: TextStyle(color: color),
    );
  }

  // Método para o ElevatedButtonThemeData
  static ElevatedButtonThemeData _elevatedButtonTheme(
      Color backgroundColor, Color foregroundColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Método para o InputDecorationTheme
  static InputDecorationTheme _inputDecorationTheme(Color color) {
    return InputDecorationTheme(
      labelStyle: TextStyle(color: color),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
