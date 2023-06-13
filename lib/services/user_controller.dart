import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../widgets/snackbar.dart';

class UserController {
  Future<bool> CheckUser(
      String username, String password, BuildContext context) async {
    var url = 'http://10.0.2.2:1323/login';
    var body = json.encode({
      'username': username,
      'password': password,
    });
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      var response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      print(response.body);

      final result = jsonDecode(response.body);
      if (result["username"] == "") {
        //--no users found--
        customSnackBar("User not found", Colors.red, context);
        return false;
      } else {
        if (result["password"] == password) {
          // Navigator.popAndPushNamed(context, '/home');
          customSnackBar("Login success", Colors.green, context);

          Navigator.pushNamed(context, '/screen1');
        } else {
          //--incorrect password--
          customSnackBar("Incorrect password", Colors.red, context);
        }
        return false;
      }
      ;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

//--add a user--
  Future<bool> AddUser(String username, String email, String password,
      BuildContext context) async {
    var url = 'http://10.0.2.2:1323/add';
    var body = json.encode({
      'username': username,
      'email': email,
      'password': password,
    });
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      var response =
          await http.post(Uri.parse(url), body: body, headers: headers);
      print(response.body);
      final result = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    // Navigator.popUntil(context, ModalRoute.withName("/home"));
    customSnackBar("User created", Colors.green, context);

    Navigator.pushNamed(context, '/screen1');
    return true;
  }

//--convert json users to user objects--
  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  //--get all--
  Future<List<User>> getAll() async {
    var url = 'http://10.0.2.2:1323/getall';

    try {
      var response = await http.get(Uri.parse(url));
      print(response.body);
      final users = parseUsers(response.body);
      return users;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
