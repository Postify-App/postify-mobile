import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/images/app_images.dart';

class CustomBusinessCardSectionWidget extends StatelessWidget {
  const CustomBusinessCardSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -30.w,
            top: 0,
            child: SvgPicture.asset(AppImages.assetsSvgBusinessHere),
          ),
          Positioned(
            left: 15.w,
            bottom: -30.h,
            child: SvgPicture.asset(AppImages.assetsSvgSocialAccountsShape),
          ),
          Positioned(
            right: 0,
            bottom: -50.h,
            child: SvgPicture.asset(AppImages.assetsSvgShape),
          ),
        ],
      ),
    );
  }
}
