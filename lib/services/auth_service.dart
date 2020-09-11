import 'dart:convert';

import 'package:bell_app/global/enviroment.dart';
import 'package:bell_app/responses/auth_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  User user;

  Future login(String email, String password) async {
    final data = {
      'email': "test6@gmail.com",
      'password': "123qwe",
    };
    final resp = await http.post("${Enviroment.apiUrl}/auth/login",
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      AuthResponse response = AuthResponse.fromJson(jsonDecode(resp.body));
      user = response.user;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future registration(String email, String name, String password) async {}
}
