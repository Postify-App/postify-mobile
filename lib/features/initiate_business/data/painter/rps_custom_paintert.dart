import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.03614458, size.height * 0.6802326);
    path_0.cubicTo(
      size.width * 0.03614458,
      size.height * 0.3045500,
      size.width * 0.3517024,
      0,
      size.width * 0.7409639,
      0,
    );
    path_0.cubicTo(
      size.width * 0.8840253,
      0,
      size.width,
      size.height * 0.1119288,
      size.width,
      size.height * 0.2500000,
    );
    path_0.lineTo(size.width, size.height * 0.4651163);
    path_0.cubicTo(
      size.width,
      size.height * 0.7219930,
      size.width * 0.7842337,
      size.height * 0.9302326,
      size.width * 0.5180723,
      size.height * 0.9302326,
    );
    path_0.lineTo(size.width * 0.2951807, size.height * 0.9302326);
    path_0.cubicTo(
      size.width * 0.1521193,
      size.height * 0.9302326,
      size.width * 0.03614458,
      size.height * 0.8183035,
      size.width * 0.03614458,
      size.height * 0.6802326,
    );
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff6BED12).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7409639, size.height * 0.005813953);
    path_1.cubicTo(
      size.width * 0.8806988,
      size.height * 0.005813953,
      size.width * 0.9939759,
      size.height * 0.1151398,
      size.width * 0.9939759,
      size.height * 0.2500000,
    );
    path_1.lineTo(size.width * 0.9939759, size.height * 0.4651163);
    path_1.cubicTo(
      size.width * 0.9939759,
      size.height * 0.7187814,
      size.width * 0.7809060,
      size.height * 0.9244186,
      size.width * 0.5180723,
      size.height * 0.9244186,
    );
    path_1.lineTo(size.width * 0.2951807, size.height * 0.9244186);
    path_1.cubicTo(
      size.width * 0.1554458,
      size.height * 0.9244186,
      size.width * 0.04216867,
      size.height * 0.8150930,
      size.width * 0.04216867,
      size.height * 0.6802326,
    );
    path_1.cubicTo(
      size.width * 0.04216867,
      size.height * 0.3077616,
      size.width * 0.3550301,
      size.height * 0.005813953,
      size.width * 0.7409639,
      size.height * 0.005813953,
    );
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color = const Color(0xff3A3A3A).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
