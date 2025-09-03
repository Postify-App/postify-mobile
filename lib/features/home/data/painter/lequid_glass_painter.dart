import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LiquidGlassPainter extends CustomPainter {
  final double animationValue;

  LiquidGlassPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    //! Create the main glass shape with subtle animation
    Path glassPath = _createAnimatedGlassPath(size);

    //! Apply glass effects using multiple layers
    _paintGlassLayers(canvas, size, glassPath);
  }

  Path _createAnimatedGlassPath(Size size) {
    Path path = Path();

    //! Add subtle wave animation to the original path
    double waveOffset = math.sin(animationValue) * 0.01;
    double waveOffset2 = math.cos(animationValue * 0.7) * 0.008;

    path.moveTo(
      size.width * (0.8829517 + waveOffset),
      size.height * 0.01877934,
    );
    path.cubicTo(
      size.width * (0.9251120 + waveOffset),
      size.height * 0.01877934,
      size.width * (0.9592875 + waveOffset2),
      size.height * 0.03454401,
      size.width * (0.9592875 + waveOffset2),
      size.height * 0.05399061,
    );
    path.lineTo(
      size.width * (0.9592875 + waveOffset2),
      size.height * 0.8661972,
    );
    path.cubicTo(
      size.width * (0.9592875 + waveOffset2),
      size.height * 0.8856444,
      size.width * (0.9251120 + waveOffset),
      size.height * 0.9014085,
      size.width * (0.8829517 + waveOffset),
      size.height * 0.9014085,
    );
    path.lineTo(size.width * (0.4529262 - waveOffset), size.height * 0.9014085);
    path.cubicTo(
      size.width * (0.4107659 - waveOffset),
      size.height * 0.9014085,
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.9171725,
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.9366197,
    );
    path.lineTo(
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.9413146,
    );
    path.cubicTo(
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.9607617,
      size.width * (0.3424148 - waveOffset),
      size.height * 0.9765258,
      size.width * (0.3002545 - waveOffset),
      size.height * 0.9765258,
    );
    path.lineTo(size.width * (0.1170483 - waveOffset), size.height * 0.9765258);
    path.cubicTo(
      size.width * (0.07488931 - waveOffset2),
      size.height * 0.9765258,
      size.width * (0.04071247 - waveOffset2),
      size.height * 0.9607617,
      size.width * (0.04071247 - waveOffset2),
      size.height * 0.9413146,
    );
    path.lineTo(
      size.width * (0.04071247 - waveOffset2),
      size.height * 0.1291080,
    );
    path.cubicTo(
      size.width * (0.04071247 - waveOffset2),
      size.height * 0.1096614,
      size.width * (0.07488931 - waveOffset2),
      size.height * 0.09389671,
      size.width * (0.1170483 - waveOffset),
      size.height * 0.09389671,
    );
    path.lineTo(
      size.width * (0.3002545 - waveOffset),
      size.height * 0.09389671,
    );
    path.cubicTo(
      size.width * (0.3424148 - waveOffset),
      size.height * 0.09389671,
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.07813204,
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.05868545,
    );
    path.lineTo(
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.05399061,
    );
    path.cubicTo(
      size.width * (0.3765903 - waveOffset2),
      size.height * 0.03454401,
      size.width * (0.4107659 - waveOffset),
      size.height * 0.01877934,
      size.width * (0.4529262 - waveOffset),
      size.height * 0.01877934,
    );
    path.lineTo(
      size.width * (0.8829517 + waveOffset),
      size.height * 0.01877934,
    );
    path.close();

    return path;
  }

  void _paintGlassLayers(Canvas canvas, Size size, Path glassPath) {
    // Layer 1: Base frosted glass with blur effect
    Paint basePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.radial(
        Offset(size.width * 0.5, size.height * 0.4),
        size.width * 0.8,
        [
          Colors.white.withValues(alpha: .15),
          Colors.white.withValues(alpha: 0.05),
          Colors.blue.withValues(alpha: 0.08),
          Colors.purple.withValues(alpha: 0.06),
        ],
        [0.0, 0.3, 0.7, 1.0],
      );
    canvas.drawPath(glassPath, basePaint);

    // Layer 2: Glass reflection effect
    Paint reflectionPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.2, size.height * 0.1),
        Offset(size.width * 0.8, size.height * 0.6),
        [
          Colors.white.withValues(alpha: 0.4),
          Colors.white.withValues(alpha: 0.1),
          Colors.transparent,
          Colors.white.withValues(alpha: 0.2),
        ],
        [0.0, 0.3, 0.7, 1.0],
      );
    canvas.drawPath(glassPath, reflectionPaint);

    // Layer 3: Liquid color layer with animated shift
    double colorShift = math.sin(animationValue * 0.5) * 0.5 + 0.5;
    Paint liquidPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.1, size.height * 0.2),
        Offset(size.width * 0.9, size.height * 0.8),
        [
          Color.lerp(
            const Color(0xff6978FF).withValues(alpha: 0.3),
            const Color(0xff0DDCAA).withValues(alpha: 0.3),
            colorShift,
          )!,
          Color.lerp(
            const Color(0xffE9D6FA).withValues(alpha: 0.2),
            const Color(0xff6978FF).withValues(alpha: 0.2),
            colorShift,
          )!,
          Color.lerp(
            const Color(0xff0DDCAA).withValues(alpha: 0.25),
            const Color(0xffE9D6FA).withValues(alpha: 0.25),
            1 - colorShift,
          )!,
        ],
        [0.0, 0.5, 1.0],
      );
    canvas.drawPath(glassPath, liquidPaint);

    // Layer 4: Border glow
    _paintGlassBorder(canvas, size, glassPath);

    // Layer 5: Liquid bubbles effect
    _paintLiquidBubbles(canvas, size, glassPath);
  }

  void _paintGlassBorder(Canvas canvas, Size size, Path glassPath) {
    // Subtle glowing border
    Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [
          Colors.white.withValues(alpha: 0.6),
          Colors.blue.withValues(alpha: 0.3),
          Colors.purple.withValues(alpha: 0.3),
          Colors.white.withValues(alpha: 0.6),
        ],
        [0.0, 0.33, 0.66, 1.0],
      );
    canvas.drawPath(glassPath, borderPaint);
  }

  void _paintLiquidBubbles(Canvas canvas, Size size, Path glassPath) {
    // Create floating bubble effects
    Paint bubblePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.3);

    // Animated bubbles
    for (int i = 0; i < 8; i++) {
      double bubblePhase = (animationValue + i * 0.8) % (2 * math.pi);
      double x =
          size.width * (0.2 + (i % 3) * 0.3) + math.sin(bubblePhase) * 30;
      double y =
          size.height * (0.3 + (i % 4) * 0.2) +
          math.cos(bubblePhase * 0.7) * 20;
      double radius = 3 + math.sin(bubblePhase * 2) * 2;

      // Check if bubble is within glass path
      if (glassPath.contains(Offset(x, y))) {
        canvas.drawCircle(Offset(x, y), radius, bubblePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! LiquidGlassPainter ||
        oldDelegate.animationValue != animationValue;
  }
}
