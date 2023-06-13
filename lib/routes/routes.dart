import 'package:flutter/material.dart';
import 'package:user_crud/screens/login_screen.dart';
import 'package:user_crud/screens/register_screen.dart';
import 'package:user_crud/screens/screen_1.dart';
import 'package:user_crud/screens/screen_2.dart';


var routes = <String, WidgetBuilder>{
  '/': (context) => LoginScreen(),
  '/register': (context) => Register(),
  '/screen1': (context) => ListViewer(),
  '/screen2': (context) => GridViewer(),
};
