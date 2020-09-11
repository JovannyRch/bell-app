import 'dart:convert';

import 'package:bell_app/global/enviroment.dart';
import 'package:bell_app/responses/auth_response.dart';
import 'package:bell_app/responses/error_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ACTION { LOGIN, REGISTRATION }

class AuthService with ChangeNotifier {
  User user;
  ErrorResponse error;
  String token;

  Future login(String email, String password) async {
    final data = {
      'email': "test6@gmail.com",
      'password': "123qwe",
    };
    return await action("${Enviroment.apiUrl}/auth/login", data);
  }

  Future registration(String email, String name, String password) async {
    final data = {
      'name': "name ",
      'email': "test100@gmail.com",
      'password': "123qwe",
    };
    return await action("${Enviroment.apiUrl}/auth/register", data);
  }

  Future action(String url, Map<String, String> data) async {
    final resp = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      AuthResponse response = AuthResponse.fromJson(jsonDecode(resp.body));
      user = response.user;
      token = response.token;
      notifyListeners();
      return true;
    } else {
      error = ErrorResponse.fromJson(jsonDecode(resp.body));
      return false;
    }
  }
}
