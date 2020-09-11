import 'package:flutter/material.dart';

class MainGroup extends StatefulWidget {
  MainGroup({Key key}) : super(key: key);

  @override
  _MainGroupState createState() => _MainGroupState();
}

class _MainGroupState extends State<MainGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Main Screen"),
      ),
    );
  }
}
