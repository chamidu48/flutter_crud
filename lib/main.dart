import 'package:flutter/material.dart';
import 'package:user_crud/const/colors.dart';
import 'package:user_crud/routes/routes.dart';
import 'package:user_crud/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User-Crud",
      theme: ThemeData(
          primaryColor: PrimaryColor,
          appBarTheme: AppBarTheme(backgroundColor: PrimaryColor)),
      routes: routes,
      initialRoute: '/',
    );
  }
}
