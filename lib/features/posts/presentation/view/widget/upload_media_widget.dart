import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class UploadMediaWidget extends StatelessWidget {
  const UploadMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.assetsSvgUpload),
            8.verticalSpace,
            Text(
              AppLocaleKey.uploadMedia.tr(),
              style: AppTextStyle.text16RDark(context),
            ),
          ],
        )
        .setContainerToView(
          color: AppColor.secondPrimaryColor(context),
          radius: 12,
        )
        .paddingAll(8)
        .setContainerToView(
          shadows: [
            const BoxShadow(
              color: Color(0xFF3A3A3A),
              blurRadius: 0,
              offset: Offset(-2, 5),
              spreadRadius: 0,
            ),
            const BoxShadow(
              color: Color(0x59000000),
              blurRadius: 50,
              offset: Offset(0, 0),
              spreadRadius: -25,
            ),
          ],
          borderColor: AppColor.secondAppColor(context),
          radius: 12,
          color: AppColor.lightMainAppColor(context),
          margin: const EdgeInsets.only(top: 16, bottom: 24),
          height: 172.h,
          width: double.infinity,
        );
  }
}
