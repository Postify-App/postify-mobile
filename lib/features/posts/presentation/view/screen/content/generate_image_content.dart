import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_header_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/schedule_post_section_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/select_social_platform_section_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/upload_media_widget.dart';

class GenerateImageContent extends StatefulWidget {
  const GenerateImageContent({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<GenerateImageContent> createState() => _GenerateImageContentState();
}

class _GenerateImageContentState extends State<GenerateImageContent> {
  void _goToPreviousPage() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeAppBar(),
          16.verticalSpace,
          CreatePostHeaderWidget(onTap: _goToPreviousPage),
          const UploadMediaWidget(),
          CustomHomeButton(
            hasShadow: true,
            text: AppLocaleKey.generateImage.tr(),
            color: AppColor.lightMainAppColor(context),
            borderColor: AppColor.darkTextColor(context),
            style: AppTextStyle.text16SBMain(
              context,
              color: AppColor.darkTextColor(context),
            ),
            radius: 10,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.assetsSvgOpen),
            ),
          ),
          32.verticalSpace,
          const SelectSocialPlatformSectionWidget(),
          16.verticalSpace,
          const SchedulePostSectionWidget(),
          const Spacer(),
          CustomHomeButton(
            text: AppLocaleKey.done.tr(),
            color: AppColor.darkTextColor(context),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
