import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/custom_post_widget.dart';

class CustomPostedListWidget extends StatelessWidget {
  const CustomPostedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => CustomPostWidget(
          isLight: true,
          button: CustomHomeButton(
            hasShadow: true,
            boxShadow: [
              BoxShadow(
                color: AppColor.lightGreyColor(context),
                blurRadius: 0,
                offset: const Offset(-2, 5),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColor.whiteColor(context),
                blurRadius: 50,
                offset: const Offset(0, 0),
                spreadRadius: -25,
              ),
            ],
            text: AppLocaleKey.analysis.tr(),
            color: AppColor.darkTextColor(context),
            style: AppTextStyle.text16SBMain(
              context,
              color: AppColor.lightMainAppColor(context),
            ),
            radius: 30,
            width: 145.w,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsSvgAnalysisButton),
            ),
          ),
        ),
        separatorBuilder: (context, index) => 24.verticalSpace,
        itemCount: 5,
      ),
    );
  }
}
