import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_crud/const/colors.dart';
import 'package:user_crud/screens/register_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 220,
            child: Image.asset('assets/images/login.png'),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: PrimaryColor,
              ),
              child: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              ' Create an account',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: _usernameController,
                        hintText: 'Username',
                        obsecure: false,
                        preIcon: Icons.person,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obsecure: true,
                        preIcon: Icons.lock,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot password',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: 'Log in',
                        onPressed: () {
                          Navigator.pushNamed(context, '/screen1');
                        },
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      )),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    double width = size.width;
    double height = size.height;

    final path = Path();

    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
