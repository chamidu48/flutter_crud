import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_crud/const/colors.dart';
import 'package:user_crud/screens/login_screen.dart';
import 'package:user_crud/widgets/snackbar.dart';

import '../services/user_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final UserController _userController = UserController();
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  Future<void> AddUser(String username, String email, String password,
      BuildContext context) async {
    setState(() {
      _loading = true;
    });
    if (username.length > 0 || email.length > 0 || password.length > 0) {
      var registered =
          await _userController.AddUser(username, email, password, context);
      if (registered == true) {
        setState(() {
          _loading = false;
        });
      }
    } else {
      customSnackBar("Please fill all fields", Colors.red, context);
      setState(() {
        _loading = false;
      });
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
                child: Image.asset('assets/images/signin.png'),
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
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Already have an account?',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                              child: Text(
                                ' Log in',
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
                            obsecure: false,
                            preIcon: Icons.email,
                            hintText: 'Email',
                            controller: _emailController),
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
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                          onPressed: () {
                            AddUser(
                                _usernameController.text,
                                _emailController.text,
                                _passwordController.text,
                                context);
                          },
                        )
                      ],
                    ),
                  )),
            ],
          ),
          )),
    );
  }
}
