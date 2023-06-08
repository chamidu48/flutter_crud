import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  CustomButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 0.5),
            color: PrimaryColorLight),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
