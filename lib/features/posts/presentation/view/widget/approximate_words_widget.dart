import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/custom_linear_slider/custom_linear_slider.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class ApproximateWordsWidget extends StatelessWidget {
  const ApproximateWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocaleKey.approximateWords.tr(),
          style: AppTextStyle.text16MDark(context),
        ),
        const Spacer(),
        SizedBox(
          width: 100.w,
          child: CustomLinearSlider(
            value: 0.5,
            activeColor: AppColor.darkTextColor(context),
            inactiveColor: AppColor.secondPrimaryColor(context),
          ),
        ),
        24.horizontalSpace,
        const Text('32').setContainerToView(
          color: AppColor.lightMainAppColor(context),
          borderColor: AppColor.darkTextColor(context),
          width: 46.w,
          radius: 10,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
