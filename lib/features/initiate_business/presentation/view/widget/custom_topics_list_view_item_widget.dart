import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';

class CustomTopicsListViewItemWidget extends StatelessWidget {
  const CustomTopicsListViewItemWidget({
    super.key,
    this.topic,
    required this.isSelected,
    required this.onTap,
  });
  final InitiateGeneralModel? topic;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Image.asset(AppImages.assetsImagesTopicCardShape),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: CustomSuffixCircleIcon(icon: topic?.logo),
        ),
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
                topic?.title ?? '',
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
                topic?.description ?? '',
                style: AppTextStyle.text16MSecond(context),
                maxLines: 2,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 25.h,
          child: Container(
            width: 72.w,
            height: 54.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isSelected
                      ? AppImages.assetsImagesSelectedTopicButtonShape
                      : AppImages.assetsImagesTopicButtonShape,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: RotatedBox(
              quarterTurns: 2,
              child: Center(
                child: SvgPicture.asset(AppImages.assetsSvgArrowBack),
              ),
            ),
          ).onTapScaleAnimation(onTap: onTap),
        ),
      ],
    );
  }
}
