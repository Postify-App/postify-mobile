import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';

class CustomArrowsSwitcherWidget extends StatelessWidget {
  const CustomArrowsSwitcherWidget({
    super.key,
    this.size,
    this.iconSize,
    this.arrowRightOnTap,
    this.arrowLeftOnTap,
  });
  final double? size;
  final double? iconSize;
  final void Function()? arrowRightOnTap;
  final void Function()? arrowLeftOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: size ?? 12.r,
          backgroundColor: AppColor.darkTextColor(context),
          child: Center(
            child: SvgPicture.asset(
              AppImages.assetsSvgArrowRight,
              height: iconSize,
            ).withRotatedBox(),
          ),
        ).onTapScaleAnimation(onTap: arrowLeftOnTap ?? () {}),
        8.horizontalSpace,
        CircleAvatar(
          radius: size ?? 12.r,
          backgroundColor: AppColor.darkTextColor(context),
          child: Center(
            child: SvgPicture.asset(
              AppImages.assetsSvgArrowRight,
              height: iconSize,
            ),
          ),
        ).onTapScaleAnimation(onTap: arrowRightOnTap ?? () {}),
      ],
    );
  }
}
