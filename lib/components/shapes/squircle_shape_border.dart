import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

//Add this CustomPaint widgets to the Widget Tre

//Copy this CustomPainter code to the Bottom of the File
class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3023846);
    path_0.cubicTo(
        0,
        size.height * 0.1557810,
        size.width * 0.01833952,
        size.height * 0.03616885,
        size.width * 0.04136707,
        size.height * 0.03350058);
    path_0.cubicTo(
        size.width * 0.1314266,
        size.height * 0.02306500,
        size.width * 0.3493595,
        size.height * -0.0001902035,
        size.width * 0.5015106,
        0);
    path_0.cubicTo(
        size.width * 0.6523172,
        size.height * 0.0001885227,
        size.width * 0.8689003,
        size.height * 0.02320038,
        size.width * 0.9586344,
        size.height * 0.03353442);
    path_0.cubicTo(size.width * 0.9816616, size.height * 0.03618654, size.width,
        size.height * 0.1558062, size.width, size.height * 0.3024269);
    path_0.lineTo(size.width, size.height * 0.6975731);
    path_0.cubicTo(
        size.width,
        size.height * 0.8441923,
        size.width * 0.9816647,
        size.height * 0.9638115,
        size.width * 0.9586344,
        size.height * 0.9664635);
    path_0.cubicTo(
        size.width * 0.8689003,
        size.height * 0.9767981,
        size.width * 0.6523172,
        size.height * 0.9998115,
        size.width * 0.5015106,
        size.height);
    path_0.cubicTo(
        size.width * 0.3493595,
        size.height * 1.000190,
        size.width * 0.1314266,
        size.height * 0.9769346,
        size.width * 0.04136707,
        size.height * 0.9664981);
    path_0.cubicTo(size.width * 0.01833949, size.height * 0.9638288, 0,
        size.height * 0.8442173, 0, size.height * 0.6976135);
    path_0.lineTo(0, size.height * 0.3023846);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
