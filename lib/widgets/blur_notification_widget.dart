import 'dart:ui';

import 'package:bell_app/const/conts.dart';
import 'package:flutter/material.dart';

class BlurNotification extends StatefulWidget {
  final List<Widget> children;
  final String text;
  final Color color;
  final String url;
  bool isShowing = false;
  BlurNotification(
      {this.children,
      this.text = "New notification",
      this.color,
      this.isShowing,
      this.url = 'images/bell3.gif'});

  @override
  _BlurNotificationState createState() => _BlurNotificationState();
}

class _BlurNotificationState extends State<BlurNotification> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ...widget.children,
        blurContainer(widget.text),
      ],
    );
  }

  Widget blurContainer(String text) {
    if (!widget.isShowing) return Container();
    return Positioned(
      top: _size.height * 0.25,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_size.width * 0.5),
          child: Container(
            height: _size.height * 0.5,
            width: _size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.url, height: 200.0),
                  SizedBox(height: 40.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
