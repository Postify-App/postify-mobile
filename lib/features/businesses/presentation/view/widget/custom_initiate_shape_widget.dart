import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/navigator_methods.dart';

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
            right: 10.w,
            top: 20.h,
            child: SvgPicture.asset(AppImages.assetsSvgInitialShape),
          ),
          Positioned(
            right: 20.w,
            top: 30.h,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.assetsSvgAboveInitiate),
                Positioned(
                  top: 15.h,
                  left: 25.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppLocaleKey.initiate.tr(),
                              style: AppTextStyle.text40LightSecond(context),
                            ),
                            TextSpan(
                              text: ' ',
                              style: AppTextStyle.text40LightSecond(context),
                            ),
                            TextSpan(
                              text: AppLocaleKey.newKey.tr(),
                              style: AppTextStyle.text40BWhite(context),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        AppLocaleKey.business.tr(),
                        style: AppTextStyle.text40SBSecond(context),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: SvgPicture.asset(AppImages.assetsSvgAddBorder),
                ),
              ],
            ),
          ),
          Positioned(
            left: -30.w,
            top: -65.h,
            child: SvgPicture.asset(AppImages.assetsSvgBG),
          ),
        ],
      ),
    ).onTapScaleAnimation(
      onTap: () {
        NavigatorMethods.pushNamed(context, RoutesName.initiateBusinessScreen);
      },
    );
  }
}
