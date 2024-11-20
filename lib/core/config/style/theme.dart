import 'package:flutter/material.dart';

class AppTheme {
  static get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ),
      primaryColor: Colors.blue,
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey[200],
        filled: true,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        focusColor: Colors.blue,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
