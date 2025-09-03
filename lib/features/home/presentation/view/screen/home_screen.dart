import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_initiate_shape_widget.dart';
import 'package:postify/features/home/presentation/view/widget/wavy_background_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            const Positioned.fill(child: LiquidGlassBackground()),
            Positioned(
              top: 25,
              left: 10,
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
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF3A3A3A),
                            blurRadius: 0,
                            offset: Offset(-2, 5),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x59000000),
                            blurRadius: 50,
                            offset: Offset(0, 0),
                            spreadRadius: -25,
                          ),
                        ],
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  const CustomInitiateShapeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
