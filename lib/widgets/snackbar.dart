import 'package:flutter/material.dart';

void customSnackBar(String text, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
  ));
}
