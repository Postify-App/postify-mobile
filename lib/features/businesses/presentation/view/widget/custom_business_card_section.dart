import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/context_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_business_base_shape_widget.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_social_shape_widget.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';

class CustomBusinessCardSectionWidget extends StatelessWidget {
  const CustomBusinessCardSectionWidget({
    super.key,
    required this.businessModel,
  });
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Transform.scale(
            scale: (constraints.maxWidth / context.width()) * 1.35,
            child: Image.asset(AppImages.assetsImagesBusinessBaseCard),
          ),
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
          right: 40.w,
          top: 60.h,
          child: Column(
            children: [
              CustomSuffixCircleIcon(icon: businessModel.logo),
              8.verticalSpace,
              CustomSuffixCircleIcon(icon: businessModel.logo),
            ],
          ),
        ),
        const CustomSocialShapeWidget(),
        Positioned(
          right: 0,
          bottom: 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.assetsImagesOpenShape,
                width: context.width() / 4,
              ),
              Positioned(
                bottom: 20.h,
                child: Text(
                  AppLocaleKey.open.tr(),
                  style: AppTextStyle.text18MSecond(context),
                ),
              ),
              Positioned(
                top: 20.h,
                right: 20.w,
                child: SvgPicture.asset(AppImages.assetsSvgOpen),
              ),
            ],
          ),
        ),
      ],
    ).onTapScaleAnimation(
      onTap: () => NavigatorMethods.pushNamed(context, RoutesName.homeScreen),
    );
  }
}
