import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double lineLength;

  LinePainter(this.lineLength);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, lineLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
