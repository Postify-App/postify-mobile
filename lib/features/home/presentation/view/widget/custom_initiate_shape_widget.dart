import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/features/home/data/painter/initiate_shape_painter.dart';

class CustomInitiateSectionWidget extends StatelessWidget {
  const CustomInitiateSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 10,
            top: 20,
            child: SvgPicture.asset(AppImages.assetsSvgInitialShape),
          ),
          Positioned(
            right: 20,
            top: 35,
            child: CustomPaint(
              size: Size(266.w, 170.h),
              painter: AboveInitiateCustomPainter(),
            ),
          ),
          Positioned(
            left: -30,
            top: -65,
            child: SvgPicture.asset(AppImages.assetsSvgBG),
          ),
        ],
      ),
    );
  }
}
