import 'package:flutter/material.dart';

class InitiateCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF7ED321), Color(0xFF5CB85C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.06971559, size.height * 0.2085995);
    path_0.cubicTo(
      size.width * 0.06529797,
      size.height * 0.1514200,
      size.width * 0.07862475,
      size.height * 0.09436667,
      size.width * 0.1058088,
      size.height * 0.05408103,
    );
    path_0.cubicTo(
      size.width * 0.1311939,
      size.height * 0.01646179,
      size.width * 0.1660939,
      size.height * -0.002709072,
      size.width * 0.2015203,
      size.height * 0.001506149,
    );
    path_0.lineTo(size.width * 0.4474576, size.height * 0.03076923);
    path_0.lineTo(size.width * 0.7338983, size.height * 0.06923077);
    path_0.lineTo(size.width * 0.9094847, size.height * 0.08358923);
    path_0.cubicTo(
      size.width * 0.9178136,
      size.height * 0.08427026,
      size.width * 0.9260508,
      size.height * 0.08659692,
      size.width * 0.9339831,
      size.height * 0.09050974,
    );
    path_0.cubicTo(
      size.width * 0.9733559,
      size.height * 0.1099333,
      size.width,
      size.height * 0.1654733,
      size.width,
      size.height * 0.2281251,
    );
    path_0.lineTo(size.width, size.height * 0.2935897);
    path_0.lineTo(size.width, size.height * 0.5589744);
    path_0.lineTo(size.width, size.height * 0.7641026);
    path_0.cubicTo(
      size.width,
      size.height * 0.8773897,
      size.width * 0.9392915,
      size.height * 0.9692308,
      size.width * 0.8644068,
      size.height * 0.9692308,
    );
    path_0.lineTo(size.width * 0.7288136, size.height * 0.9692308);
    path_0.lineTo(size.width * 0.07914068, size.height * 0.9601744);
    path_0.cubicTo(
      size.width * 0.03558644,
      size.height * 0.9595641,
      size.width * 0.004084949,
      size.height * 0.8970205,
      size.width * 0.01525424,
      size.height * 0.8333333,
    );
    path_0.lineTo(size.width * 0.06525424, size.height * 0.6277846);
    path_0.cubicTo(
      size.width * 0.08363966,
      size.height * 0.5522051,
      size.width * 0.08999966,
      size.height * 0.4711369,
      size.width * 0.08381966,
      size.height * 0.3911451,
    );
    path_0.lineTo(size.width * 0.06971559, size.height * 0.2085995);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawPath(path_0, paint0Fill);

    Path shadowPath = Path.from(path_0);
    shadowPath = shadowPath.shift(const Offset(2, 3));
    Paint shadowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawPath(shadowPath, shadowPaint);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1069949, size.height * 0.05591436);
    path_1.cubicTo(
      size.width * 0.1320302,
      size.height * 0.01881349,
      size.width * 0.1664492,
      size.height * -0.00009548462,
      size.width * 0.2013871,
      size.height * 0.004061497,
    );
    path_1.lineTo(size.width * 0.4473085, size.height * 0.03331831);
    path_1.lineTo(size.width * 0.4473085, size.height * 0.03332333);
    path_1.lineTo(size.width * 0.7337492, size.height * 0.07178462);
    path_1.lineTo(size.width * 0.7337797, size.height * 0.07178974);
    path_1.lineTo(size.width * 0.7338068, size.height * 0.07178974);
    path_1.lineTo(size.width * 0.9093932, size.height * 0.08614769);
    path_1.cubicTo(
      size.width * 0.9175763,
      size.height * 0.08681692,
      size.width * 0.9256678,
      size.height * 0.08910513,
      size.width * 0.9334576,
      size.height * 0.09294872,
    );
    path_1.cubicTo(
      size.width * 0.9721322,
      size.height * 0.1120282,
      size.width * 0.9983051,
      size.height * 0.1665836,
      size.width * 0.9983051,
      size.height * 0.2281251,
    );
    path_1.lineTo(size.width * 0.9983051, size.height * 0.7641026);
    path_1.cubicTo(
      size.width * 0.9983051,
      size.height * 0.8759744,
      size.width * 0.9383559,
      size.height * 0.9666667,
      size.width * 0.8644068,
      size.height * 0.9666667,
    );
    path_1.lineTo(size.width * 0.7288305, size.height * 0.9666667);
    path_1.lineTo(size.width * 0.07915797, size.height * 0.9576051);
    path_1.cubicTo(
      size.width * 0.03672780,
      size.height * 0.9570154,
      size.width * 0.006030881,
      size.height * 0.8961128,
      size.width * 0.01687634,
      size.height * 0.8340718,
    );
    path_1.lineTo(size.width * 0.06684644, size.height * 0.6286718);
    path_1.cubicTo(
      size.width * 0.08532339,
      size.height * 0.5527128,
      size.width * 0.09171492,
      size.height * 0.4712359,
      size.width * 0.08550373,
      size.height * 0.3908451,
    );
    path_1.lineTo(size.width * 0.07139831, size.height * 0.2083031);
    path_1.cubicTo(
      size.width * 0.06704136,
      size.height * 0.1519118,
      size.width * 0.08018576,
      size.height * 0.09564462,
      size.width * 0.1069949,
      size.height * 0.05591436,
    );
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = const Color(0xFF4A5D23).withOpacity(0.8);
    canvas.drawPath(path_1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AboveInitiateCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.09618582, size.height * 0.05727627);
    path_0.cubicTo(
      size.width * 0.1214690,
      size.height * 0.01906426,
      size.width * 0.1562142,
      size.height * -0.0004076367,
      size.width * 0.1914812,
      size.height * 0.003871580,
    );
    path_0.lineTo(size.width * 0.4405172, size.height * 0.03409302);
    path_0.lineTo(size.width * 0.4405172, size.height * 0.03408722);
    path_0.lineTo(size.width * 0.7304559, size.height * 0.07379704);
    path_0.lineTo(size.width * 0.7304904, size.height * 0.07380296);
    path_0.lineTo(size.width * 0.7305249, size.height * 0.07380296);
    path_0.lineTo(size.width * 0.9082835, size.height * 0.08863018);
    path_0.cubicTo(
      size.width * 0.9165402,
      size.height * 0.08931893,
      size.width * 0.9247011,
      size.height * 0.09167219,
      size.width * 0.9325632,
      size.height * 0.09562781,
    );
    path_0.cubicTo(
      size.width * 0.9716398,
      size.height * 0.1152864,
      size.width * 0.9980843,
      size.height * 0.1715444,
      size.width * 0.9980843,
      size.height * 0.2350107,
    );
    path_0.lineTo(size.width * 0.9980843, size.height * 0.7882308);
    path_0.cubicTo(
      size.width * 0.9980843,
      size.height * 0.9035503,
      size.width * 0.9374138,
      size.height * 0.9970414,
      size.width * 0.8627395,
      size.height * 0.9970414,
    );
    path_0.lineTo(size.width * 0.7254943, size.height * 0.9970414);
    path_0.lineTo(size.width * 0.06775709, size.height * 0.9876864);
    path_0.cubicTo(
      size.width * 0.02499050,
      size.height * 0.9870769,
      size.width * -0.005947280,
      size.height * 0.9244201,
      size.width * 0.004976360,
      size.height * 0.8605799,
    );
    path_0.lineTo(size.width * 0.05377816, size.height * 0.6559822);
    path_0.cubicTo(
      size.width * 0.07366322,
      size.height * 0.5726154,
      size.width * 0.08054444,
      size.height * 0.4831793,
      size.width * 0.07385939,
      size.height * 0.3949355,
    );
    path_0.lineTo(size.width * 0.06019157, size.height * 0.2145030);
    path_0.cubicTo(
      size.width * 0.05578352,
      size.height * 0.1563142,
      size.width * 0.06907395,
      size.height * 0.09825266,
      size.width * 0.09618582,
      size.height * 0.05727627,
    );
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.color = const Color(0xff3A3A3A).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffC2C2C2).withOpacity(0.63);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BehindInitiateCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFE9D6FA), Color(0xFFE9D6FA), Color(0xFFE9D6FA)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.08396947, size.height * 0.3086420);
    path_0.cubicTo(
      size.width * 0.08396947,
      size.height * 0.2234130,
      size.width * 0.1409308,
      size.height * 0.1543210,
      size.width * 0.2111959,
      size.height * 0.1543210,
    );
    path_0.lineTo(size.width * 0.8944020, size.height * 0.1543210);
    path_0.cubicTo(
      size.width * 0.9063461,
      size.height * 0.1543210,
      size.width * 0.9160305,
      size.height * 0.1660667,
      size.width * 0.9160305,
      size.height * 0.1805556,
    );
    path_0.cubicTo(
      size.width * 0.9118092,
      size.height * 0.2394571,
      size.width * 0.8691527,
      size.height * 0.2831583,
      size.width * 0.8205700,
      size.height * 0.2783568,
    );
    path_0.lineTo(size.width * 0.3129237, size.height * 0.2281840);
    path_0.cubicTo(
      size.width * 0.2582672,
      size.height * 0.2227821,
      size.width * 0.2069092,
      size.height * 0.2604651,
      size.width * 0.1854807,
      size.height * 0.3216914,
    );
    path_0.lineTo(size.width * 0.1834936, size.height * 0.3273673);
    path_0.cubicTo(
      size.width * 0.1710354,
      size.height * 0.3629630,
      size.width * 0.1700489,
      size.height * 0.4029352,
      size.width * 0.1807295,
      size.height * 0.4393704,
    );
    path_0.lineTo(size.width * 0.1844784, size.height * 0.4521605);
    path_0.lineTo(size.width * 0.1895674, size.height * 0.4799383);
    path_0.lineTo(size.width * 0.1921120, size.height * 0.5061728);
    path_0.lineTo(size.width * 0.1921120, size.height * 0.5308642);
    path_0.lineTo(size.width * 0.1895674, size.height * 0.5570988);
    path_0.lineTo(size.width * 0.1870229, size.height * 0.5817901);
    path_0.lineTo(size.width * 0.1832061, size.height * 0.6049383);
    path_0.lineTo(size.width * 0.1768448, size.height * 0.6419753);
    path_0.lineTo(size.width * 0.1730280, size.height * 0.6604938);
    path_0.lineTo(size.width * 0.1679389, size.height * 0.6790123);
    path_0.lineTo(size.width * 0.1463104, size.height * 0.7515432);
    path_0.lineTo(size.width * 0.1456415, size.height * 0.7541389);
    path_0.cubicTo(
      size.width * 0.1418684,
      size.height * 0.7687840,
      size.width * 0.1399491,
      size.height * 0.7840401,
      size.width * 0.1399491,
      size.height * 0.7993827,
    );
    path_0.lineTo(size.width * 0.1399491, size.height * 0.8163580);
    path_0.cubicTo(
      size.width * 0.1399491,
      size.height * 0.8325525,
      size.width * 0.1291265,
      size.height * 0.8456790,
      size.width * 0.1157761,
      size.height * 0.8456790,
    );
    path_0.cubicTo(
      size.width * 0.09820967,
      size.height * 0.8456790,
      size.width * 0.08396947,
      size.height * 0.8284074,
      size.width * 0.08396947,
      size.height * 0.8070988,
    );
    path_0.lineTo(size.width * 0.08396947, size.height * 0.3086420);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    paint0Fill.color = paint0Fill.color.withOpacity(0.4);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2111959, size.height * 0.158642);
    path_1.lineTo(size.width * 0.8944020, size.height * 0.1558642);
    path_1.cubicTo(
      size.width * 0.9056285,
      size.height * 0.1558642,
      size.width * 0.9147277,
      size.height * 0.1668864,
      size.width * 0.9147557,
      size.height * 0.1804954,
    );
    path_1.cubicTo(
      size.width * 0.9105623,
      size.height * 0.2385139,
      size.width * 0.8685369,
      size.height * 0.2815500,
      size.width * 0.8206718,
      size.height * 0.2768194,
    );
    path_1.lineTo(size.width * 0.3130280, size.height * 0.2266469);
    path_1.cubicTo(
      size.width * 0.2578244,
      size.height * 0.2211910,
      size.width * 0.2059524,
      size.height * 0.2592497,
      size.width * 0.1843094,
      size.height * 0.3210864,
    );
    path_1.lineTo(size.width * 0.1823214, size.height * 0.3267654);
    path_1.cubicTo(
      size.width * 0.1697392,
      size.height * 0.3627160,
      size.width * 0.1687440,
      size.height * 0.4030864,
      size.width * 0.1795310,
      size.height * 0.4398858,
    );
    path_1.lineTo(size.width * 0.1832509, size.height * 0.4525772);
    path_1.lineTo(size.width * 0.1883125, size.height * 0.4802130);
    path_1.lineTo(size.width * 0.1908397, size.height * 0.5062500);
    path_1.lineTo(size.width * 0.1908397, size.height * 0.5307870);
    path_1.lineTo(size.width * 0.1883051, size.height * 0.5569074);
    path_1.lineTo(size.width * 0.1857656, size.height * 0.5815494);
    path_1.lineTo(size.width * 0.1819611, size.height * 0.6046235);
    path_1.lineTo(size.width * 0.1756097, size.height * 0.6416019);
    path_1.lineTo(size.width * 0.1718053, size.height * 0.6600586);
    path_1.lineTo(size.width * 0.1667313, size.height * 0.6785247);
    path_1.lineTo(size.width * 0.1451153, size.height * 0.7510185);
    path_1.lineTo(size.width * 0.1451053, size.height * 0.7510494);
    path_1.lineTo(size.width * 0.1450954, size.height * 0.7510833);
    path_1.lineTo(size.width * 0.1444270, size.height * 0.7536790);
    path_1.cubicTo(
      size.width * 0.1406155,
      size.height * 0.7684753,
      size.width * 0.1386768,
      size.height * 0.7838827,
      size.width * 0.1386768,
      size.height * 0.7993827,
    );
    path_1.lineTo(size.width * 0.1386768, size.height * 0.8163580);
    path_1.cubicTo(
      size.width * 0.1386768,
      size.height * 0.8317006,
      size.width * 0.1284239,
      size.height * 0.8441358,
      size.width * 0.1157761,
      size.height * 0.8441358,
    );
    path_1.cubicTo(
      size.width * 0.09891247,
      size.height * 0.8441358,
      size.width * 0.08524173,
      size.height * 0.8275525,
      size.width * 0.08524173,
      size.height * 0.8070988,
    );
    path_1.lineTo(size.width * 0.08524173, size.height * 0.3086420);
    path_1.cubicTo(
      size.width * 0.08524173,
      size.height * 0.2242651,
      size.width * 0.1416333,
      size.height * 0.1558642,
      size.width * 0.2111959,
      size.height * 0.1558642,
    );
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = const Color(
        0xFF6A1B9A,
      ).withValues(alpha: .6); // Darker purple border
    canvas.drawPath(path_1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
