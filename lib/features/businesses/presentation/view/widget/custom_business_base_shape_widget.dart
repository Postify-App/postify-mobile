import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';

class CustomBusinessBaseShapeWidget extends StatelessWidget {
  const CustomBusinessBaseShapeWidget({super.key, required this.businessModel});
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -20.w,
      top: 0,
      child: Stack(
        children: [
          Transform.scale(
            scale: 1.r,
            child: Image.asset(AppImages.assetsImagesBusinessBaseCard),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50.w,
              top: 60.h,
              right: 80.w,
              bottom: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250.w,
                  child: Text(
                    businessModel.name ?? '',
                    style: AppTextStyle.text32BSecond(
                      context,
                    ).copyWith(height: 1.1),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                2.verticalSpace,
                Container(
                  width: 200.w,
                  height: 1.h,
                  color: AppColor.secondAppColor(context),
                ),
                4.verticalSpace,
                Text(
                  businessModel.description ?? '',
                  style: AppTextStyle.text16RWhite(context),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Positioned(
            right: 50.w,
            top: 70.h,
            child: Column(
              children: [
                CustomSuffixCircleIcon(icon: businessModel.logo),
                8.verticalSpace,
                CustomSuffixCircleIcon(icon: businessModel.logo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
