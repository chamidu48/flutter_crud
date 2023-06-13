import 'package:flutter/material.dart';

class User {
  final String username;
  final String email;

  User({required this.username, required this.email});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': username,
        'email': email,
      };
}
