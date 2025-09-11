import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class EngagementUpWidget extends StatelessWidget {
  const EngagementUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 152.h,
        decoration: BoxDecoration(
          color: AppColor.lightMainAppColor(context),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocaleKey.engagementUp.tr(),
                        style: AppTextStyle.text32SBDark(context),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: '12%',
                        style: AppTextStyle.text32SBDarkGreen(context),
                      ),
                    ],
                  ),
                ),
              ),
              FadeInUp(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: Text(
                      AppLocaleKey.keepGoing.tr(),
                      style: AppTextStyle.text32SBDark(
                        context,
                      ).copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
