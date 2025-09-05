import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomInitiateBusinessBackButton extends StatelessWidget {
  const CustomInitiateBusinessBackButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 15.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.assetsImagesBackShape),
          Positioned(
            top: 12.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.assetsSvgArrowBack),
                8.horizontalSpace,
                Text(
                  AppLocaleKey.back.tr(),
                  style: AppTextStyle.text16BSecond(context),
                ),
              ],
            ),
          ),
        ],
      ).onTapScaleAnimation(onTap: onPressed),
    );
  }
}
