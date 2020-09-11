import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  final String title;
  List<Widget> actions = [];
  TitleScreen(this.title, {this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _title(),
      ],
    );
  }

  Widget _title() {
    return Container(
      padding: EdgeInsets.only(top: 17.0, left: 40.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 31.0,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          letterSpacing: 1.3,
        ),
      ),
    );
  }
}
