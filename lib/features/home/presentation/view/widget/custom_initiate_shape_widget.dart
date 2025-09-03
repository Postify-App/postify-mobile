import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/features/home/data/painter/initiate_shape_painter.dart';

class CustomInitiateShapeWidget extends StatelessWidget {
  const CustomInitiateShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            child: CustomPaint(
              size: Size(297.w, 190.h),
              painter: InitiateCustomPainter(),
            ),
          ),
          Positioned(
            left: -20,
            child: CustomPaint(
              size: Size(327.w, 224.h),
              painter: BehindInitiateCustomPainter(),
            ),
          ),
        ],
      ),
    );
  }
}
