import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/context_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';

class CustomCreatePostWidget extends StatelessWidget {
  const CustomCreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,
      width: context.width() / 2.8,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.mainAppColor(context).withValues(alpha: 0.1),
            AppColor.mainAppColor(context).withValues(alpha: 0.2),
            AppColor.mainAppColor(context).withValues(alpha: 0.3),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: CustomHomeButton(
          color: AppColor.greenColor(context),
          hasShadow: true,
          radius: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.assetsSvgCreatePost),
              4.verticalSpace,
              Text(
                AppLocaleKey.createPost.tr(),
                style: AppTextStyle.text18BlackSecond(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
