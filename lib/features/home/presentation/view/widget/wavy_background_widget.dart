import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:postify/core/extension/context_extension.dart';
import 'package:postify/features/home/data/painter/lequid_glass_painter.dart';

class LiquidGlassBackground extends StatefulWidget {
  const LiquidGlassBackground({super.key});

  @override
  State<LiquidGlassBackground> createState() => _LiquidGlassBackgroundState();
}

class _LiquidGlassBackgroundState extends State<LiquidGlassBackground>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
            context.width(),
            (context.width() * 2.16793893129771).toDouble(),
          ),
          painter: LiquidGlassPainter(_animation.value),
        );
      },
    );
  }
}
