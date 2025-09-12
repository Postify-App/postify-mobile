import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/custom_posted_list_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/scheduled_posts_list_widgets.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const CustomHomeAppBar(),
                24.verticalSpace,
                const ScheduledPostsListWidget(),
                45.verticalSpace,
                Text(
                  AppLocaleKey.posted.tr(),
                  style: AppTextStyle.text32BDark(context).copyWith(height: 1),
                ),
              ]),
            ),
          ),
          const CustomPostedListWidget(),
        ],
      ),
    );
  }
}
