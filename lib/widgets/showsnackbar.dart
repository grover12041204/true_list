import 'package:flutter/material.dart';

void showInSnackBarFinal(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.deepOrange,
      content: Text(value),
    ),
  );
}
