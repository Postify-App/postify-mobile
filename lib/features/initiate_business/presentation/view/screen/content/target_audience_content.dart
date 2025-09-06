import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_target_audience_grid_view.dart';

class TargetAudienceContent extends StatefulWidget {
  const TargetAudienceContent({super.key});

  @override
  State<TargetAudienceContent> createState() => _TargetAudienceContentState();
}

class _TargetAudienceContentState extends State<TargetAudienceContent> {
  final ValueNotifier<int> selectedAudienceIndex = ValueNotifier<int>(0);
  final ValueNotifier<int> selectedGoalIndex = ValueNotifier<int>(0);

  final List<String> audienceOptions = [
    "Young Adults (18–25)",
    "Professionals (25–40)",
    "Parents & Families",
    "Global & International",
  ];

  final List<String> goalOptions = [
    "Build Awareness",
    "Increase Engagement",
    "Educate & Inform",
    "Grow Followers",
  ];

  @override
  void dispose() {
    selectedAudienceIndex.dispose();
    selectedGoalIndex.dispose();
    super.dispose();
  }

  int get currentAudienceSelection => selectedAudienceIndex.value;
  int get currentGoalSelection => selectedGoalIndex.value;

  String get selectedAudienceText => audienceOptions[currentAudienceSelection];
  String get selectedGoalText => goalOptions[currentGoalSelection];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.verticalSpace,
        SizedBox(
          height: 150.h,
          child: ValueListenableBuilder<int>(
            valueListenable: selectedAudienceIndex,
            builder: (context, selectedIndex, child) {
              return CustomTargetAudienceGridView(
                options: audienceOptions,
                selectedIndex: selectedIndex,
                onSelect: (index) {
                  selectedAudienceIndex.value = index;
                },
              );
            },
          ),
        ),
        32.verticalSpace,
        Text(
          AppLocaleKey.whatsYourMainGoal.tr(),
          style: AppTextStyle.text16MWhite(context),
        ),
        16.verticalSpace,
        SizedBox(
          height: 180.h,
          child: ValueListenableBuilder<int>(
            valueListenable: selectedGoalIndex,
            builder: (context, selectedIndex, child) {
              return CustomTargetAudienceGridView(
                options: goalOptions,
                selectedIndex: selectedIndex,
                onSelect: (index) {
                  selectedGoalIndex.value = index;
                },
              );
            },
          ),
        ),
        24.verticalSpace, // Bottom spacing
      ],
    );
  }
}
