import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/home/presentation/view/widget/custom_business_card_section.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_initiate_shape_widget.dart';
import 'package:postify/features/home/presentation/view/widget/wavy_background_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(child: LiquidGlassBackground()),
            Positioned(
              top: 25.h,
              left: 10.w,
              child: Image.asset(AppImages.assetsImagesHomeLogo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomHomeButton(
                        text: AppLocaleKey.yourBusinesses.tr(),
                        prefixIcon: SvgPicture.asset(
                          AppImages.assetsSvgArrowRight,
                        ),
                        width: 200.w,
                        borderColor: AppColor.whiteColor(context),
                        hasShadow: true,
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  const CustomInitiateSectionWidget(),
                  const CustomBusinessCardSectionWidget(),
                ],
              ),
            ),
            Positioned(
              bottom: 35.h,
              left: 35.w,
              child: CustomHomeButton(
                text: AppLocaleKey.add.tr(),
                prefixIcon: SvgPicture.asset(AppImages.assetsSvgArrowTop),
                width: 100.w,
                height: 48.h,
                color: AppColor.greenColor(context),
                textColor: AppColor.blackColor(context),
                hasShadow: true,
              ),
            ),
            Positioned(
              bottom: 15.h,
              right: 15.w,
              child: CustomHomeButton(
                text: AppLocaleKey.recommendation.tr(),
                suffixIcon: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColor.secondAppColor(context),
                  child: SvgPicture.asset(AppImages.assetsSvgArrowRight),
                ),
                width: 213.w,
                height: 48.h,
                color: AppColor.greenColor(context),
                textColor: AppColor.blackColor(context),
                hasShadow: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
