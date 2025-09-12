import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomToneOfVoiceSelectedWidget extends StatelessWidget {
  const CustomToneOfVoiceSelectedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocaleKey.toneOfVoice.tr(),
          style: AppTextStyle.text16MDark(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Friendly & Fun', style: AppTextStyle.text12BDark(context)),
            8.horizontalSpace,
            const CustomNetworkImage(imageUrl: '', isSvg: true, height: 17),
          ],
        ).setContainerToView(
          color: AppColor.secondPrimaryColor(context),
          borderColor: AppColor.darkTextColor(context),
          radius: 10,
          padding: const EdgeInsets.all(5),
          width: 137.w,
          alignment: Alignment.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocaleKey.edit.tr(),
              style: AppTextStyle.text12BDark(context),
            ),
            8.horizontalSpace,
            SvgPicture.asset(AppImages.assetsSvgOpen, height: 15),
          ],
        ).setContainerToView(
          color: AppColor.lightMainAppColor(context),
          borderColor: AppColor.darkTextColor(context),
          radius: 10,
          padding: const EdgeInsets.all(5),
          width: 76.w,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
