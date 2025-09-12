import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class AiOutputWidget extends StatelessWidget {
  const AiOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, bottom: 24),
      decoration: BoxDecoration(
        color: AppColor.lightMainAppColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.secondAppColor(context)),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocaleKey.aiOutput.tr(),
          style: AppTextStyle.text14RDark(context),
        ),
      ),
    );
  }
}
