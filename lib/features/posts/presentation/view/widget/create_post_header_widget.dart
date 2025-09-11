import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CreatePostHeaderWidget extends StatelessWidget {
  const CreatePostHeaderWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.assetsSvgArrowBack,
        ).onTapScaleAnimation(onTap: onTap ?? () => Navigator.pop(context)),
        16.horizontalSpace,
        Text(
          AppLocaleKey.createPost.tr(),
          style: AppTextStyle.text32BDark(context),
        ),
      ],
    );
  }
}
