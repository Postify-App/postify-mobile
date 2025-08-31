import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColor.dividerColor(context))),
        5.horizontalSpace,
        Text(AppLocaleKey.or.tr(), style: AppTextStyle.text16RGrey(context)),
        5.horizontalSpace,
        Expanded(child: Divider(color: AppColor.dividerColor(context))),
      ],
    );
  }
}
