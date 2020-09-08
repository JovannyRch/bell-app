import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSendingNotification = false;
  Timer timer;
  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (!isSendingNotification) {
        sendNotification();
      }
    });
    super.initState();
  }

  void sendNotification() {
    setState(() {
      isSendingNotification = true;
    });
    timer = Timer(Duration(seconds: 5), () {
      setState(() {
        isSendingNotification = false;
        timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isSendingNotification
            ? Image.asset('images/bell2.gif')
            : FlatButton(
                onPressed: () {
                  sendNotification();
                },
                child: Text("Enviar notificación"),
              ),
      ),
    );
  }
}
