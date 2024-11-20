import 'package:flutter/material.dart';

extension BuildContextHelper on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
