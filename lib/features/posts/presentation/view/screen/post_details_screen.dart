import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/data/model/posts_model.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/create_post_header_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/select_social_platform_section_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/custom_post_details_card_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/social_states_grid_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, this.postModel});
  final PostModel? postModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightMainAppColor(context),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHomeAppBar(),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHeaderWidget(title: AppLocaleKey.postDetails.tr()),
                    Column(
                      children: [
                        Text(
                          AppLocaleKey.releaseDate.tr(),
                          style: AppTextStyle.text16MDark(context),
                        ),
                        Text(
                          '10:30 pm, 20 Dec',
                          style: AppTextStyle.text11MDark(context),
                        ),
                      ],
                    ),
                  ],
                ),
                const CustomPostDetailsCardWidget(),
                const SelectSocialPlatformListWidget(),
                32.verticalSpace,
                Text(
                  AppLocaleKey.overview.tr(),
                  style: AppTextStyle.text32BDark(context),
                ),
                16.verticalSpace,
                const SocialStatsWrapWidget(),
                24.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
