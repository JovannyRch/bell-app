import 'package:bell_app/const/conts.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final Function f;

  ButtonAuth(this.text, this.f);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: f,
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30.0,
                width: 55.0,
                margin: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
