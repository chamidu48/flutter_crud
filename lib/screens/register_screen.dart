import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_crud/const/colors.dart';
import 'package:user_crud/screens/login_screen.dart';

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

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
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
            child: Image.asset('assets/images/signin.png'),
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
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
                        text: 'Register',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/screen1');
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
