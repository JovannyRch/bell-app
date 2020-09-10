import 'package:bell_app/const/conts.dart';
import 'package:flutter/material.dart';

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter5(),
      ),
    );
  }
}

class _MiPainter5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = kBaseColor;
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //path.arcTo();
    //path.lineTo(size.width, size.height * 0.45);

    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.35, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
