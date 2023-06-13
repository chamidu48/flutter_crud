import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_crud/const/colors.dart';
import 'package:user_crud/screens/register_screen.dart';
import 'package:user_crud/services/user_controller.dart';

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
  final UserController _userController = UserController();
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  Future<void> checkUser(
      String username, String password, BuildContext context) async {
    if (username.length > 0 && password.length > 0) {
      setState(() {
        _loading = true;
      });
      var hasUser =
          await _userController.CheckUser(username, password, context);
      if (hasUser == false) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.4,
              child: Image.asset('assets/images/login.png'),
            ),
            Container(
                height: size.shortestSide,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                ),
                child: Padding(
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
                        child: _loading
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                        onPressed: () {
                          checkUser(_usernameController.text,
                              _passwordController.text, context);
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
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
