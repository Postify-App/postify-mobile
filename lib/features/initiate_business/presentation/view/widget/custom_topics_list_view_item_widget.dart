import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomTopicsListViewItemWidget extends StatelessWidget {
  const CustomTopicsListViewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.assetsImagesTopicCardShape),
        Padding(
          padding: EdgeInsets.only(
            left: 40.w,
            top: 50.h,
            right: 80.w,
            bottom: 40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Influencer',
                style: AppTextStyle.text32BSecond(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Container(
                width: 150.w,
                height: 2.h,
                color: AppColor.dividerColor(context),
              ),
              8.verticalSpace,
              Text(
                'Build your voice, grow your audience, and connect.',
                style: AppTextStyle.text16MSecond(context),
                maxLines: 2,
              ),
            ],
          ),
        ),
        Positioned(
          right: 15.w,
          bottom: 30.h,
          child: Container(
            width: 72.w,
            height: 54.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.assetsImagesTopicButtonShape),
                fit: BoxFit.cover,
              ),
            ),
            child: RotatedBox(
              quarterTurns: 2,
              child: Center(
                child: SvgPicture.asset(AppImages.assetsSvgArrowBack),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
