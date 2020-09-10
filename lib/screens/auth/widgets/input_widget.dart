import 'package:bell_app/const/conts.dart';
import 'package:flutter/material.dart';

class InputAuth extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPassword;
  InputAuth(this.label, this.controller, this.icon, {this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: TextField(
        obscureText: this.isPassword,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          focusColor: kBaseColor,
          fillColor: kBaseColor,
          labelText: label,
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
