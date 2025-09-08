import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';

class CustomSocialShapeWidget extends StatelessWidget {
  const CustomSocialShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.w,
      bottom: -40,
      child: Stack(
        children: [
          Image.asset(AppImages.assetsImagesSocialAccountsShape),
          Positioned(
            left: 20,
            child: Row(
              children: List.generate(socialOptions.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 2, top: 5),
                  child: Image.asset(socialOptions[index].logo!, height: 15),
                );
              }),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Row(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(AppImages.assetsSvgFollowers),
                    Text('100k', style: AppTextStyle.text6SBSecond(context)),
                  ],
                ),
                22.horizontalSpace,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColor.blackColor(context),
                ),
                22.horizontalSpace,
                Column(
                  children: [
                    SvgPicture.asset(AppImages.assetsSvgLikes),
                    Text('50k', style: AppTextStyle.text6SBSecond(context)),
                  ],
                ),
                22.horizontalSpace,
                Container(
                  height: 30,
                  width: 1,
                  color: AppColor.blackColor(context),
                ),
                22.horizontalSpace,
                Column(
                  children: [
                    SvgPicture.asset(AppImages.assetsSvgNotifications),
                    Text('49', style: AppTextStyle.text6SBSecond(context)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
