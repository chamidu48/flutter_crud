import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  IconData preIcon;
  TextEditingController controller;
  bool obsecure;
  CustomTextField(
      {super.key,
      required this.obsecure,
      required this.preIcon,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: TextField(
        controller: controller,
        style: TextStyle(color: PrimaryColor, fontSize: 14),
        cursorColor: PrimaryColorDark,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            prefixIcon: Icon(
              preIcon,
              color: PrimaryColorLight,
              size: 20,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: PrimaryColorLight, fontSize: 12),
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        obscureText: obsecure,
      ),
    );
  }
}
