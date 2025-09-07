import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/audience_grid_widget.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/main_goal_grid_widget.dart';

class TargetAudienceContent extends StatelessWidget {
  const TargetAudienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [24.verticalSpace],
          ),
        ),
        const AudienceGridWidget(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                AppLocaleKey.whatsYourMainGoal.tr(),
                style: AppTextStyle.text16MWhite(context),
              ),
              16.verticalSpace,
            ],
          ),
        ),
        const MainGoalGridWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}
