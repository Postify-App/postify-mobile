import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class SigninWithGoogleWidget extends StatelessWidget {
  const SigninWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.whiteColor(context),
        border: Border.all(color: AppColor.borderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.assetsSvgGoogleLogo),
          16.horizontalSpace,
          FadeInLeft(
            from: 30,
            duration: const Duration(milliseconds: 500),
            child: Text(
              AppLocaleKey.signInWithGoogle.tr(),
              style: AppTextStyle.text14RSecond(context),
            ),
          ),
        ],
      ),
    );
  }
}
