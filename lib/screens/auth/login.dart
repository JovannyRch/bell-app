import 'dart:ui';

import 'package:bell_app/const/conts.dart';
import 'package:bell_app/screens/auth/register.dart';
import 'package:bell_app/screens/auth/widgets/bg_widget.dart';
import 'package:bell_app/screens/auth/widgets/blurContainer.dart';
import 'package:bell_app/screens/auth/widgets/button_auth.dart';
import 'package:bell_app/screens/auth/widgets/custom_input.dart';
import 'package:bell_app/screens/auth/widgets/input_widget.dart';
import 'package:bell_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;
  bool isLoading = false;

  TextEditingController password = new TextEditingController();
  TextEditingController username = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlurContainer(
        isLoading: isLoading,
        color: kBaseColor,
        children: [
          HeaderWave(),
          content(),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo(),
          form(),
        ],
      ),
    );
  }

  Widget btnImage(String path) {
    return Image.asset(path, height: 30.0);
  }

  Widget logo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bell App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget linkRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text(
            "Create",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 18.0),
          ),
        )
      ],
    );
  }

  void changeLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  void onLogin() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    changeLoading(true);
    bool ok = await auth.login(username.text, password.text);
    changeLoading(false);
  }

  Widget form() {
    return Container(
      width: _size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Login into your account",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          CustomInput(
              icon: Icons.person,
              placeholder: 'Email',
              textController: username),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: password,
            isPassword: true,
          ),
          SizedBox(
            height: 15.0,
          ),
          ButtonAuth("Login", onLogin),
          SizedBox(
            height: 40.0,
          ),
          linkRegister(),
        ],
      ),
    );
  }
}
