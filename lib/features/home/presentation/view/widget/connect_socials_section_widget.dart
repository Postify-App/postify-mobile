import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/data/model/connect_socials_model.dart';
import 'package:postify/features/home/presentation/view/widget/custom_connect_social_item_widget.dart';

class ConnectSocialsSectionWidget extends StatelessWidget {
  const ConnectSocialsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocaleKey.connectSocials.tr(),
              style: AppTextStyle.text20MDark(context),
            ),

            Row(
              children: [
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColor.darkTextColor(context),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.assetsSvgArrowRight,
                    ).withRotatedBox(),
                  ),
                ),
                8.horizontalSpace,
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColor.darkTextColor(context),
                  child: Center(
                    child: SvgPicture.asset(AppImages.assetsSvgArrowRight),
                  ),
                ),
              ],
            ),
          ],
        ),
        16.verticalSpace,
        SizedBox(
          height: 135.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CustomConnectSocialsItemWidget(
                connectSocialsModel: mockConnectSocials[index],
              ).animateStaggered(index);
            },
            separatorBuilder: (BuildContext context, int index) =>
                16.horizontalSpace,
            itemCount: mockConnectSocials.length,
          ),
        ),
      ],
    );
  }
}
