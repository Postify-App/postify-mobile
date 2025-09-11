import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/home/presentation/view/widget/custom_create_post_widget.dart';
import 'package:postify/features/home/presentation/view/widget/engagement_up_widget.dart';
import 'package:postify/features/home/presentation/view/widget/main_section_content_widget.dart';

class CustomHomeMainSection extends StatelessWidget {
  const CustomHomeMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 410.h,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.mainAppColor(context).withValues(alpha: 0.3),
                AppColor.mainAppColor(context).withValues(alpha: 0.2),
                AppColor.mainAppColor(context).withValues(alpha: 0.1),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
          child: const MainSectionContentWidget(),
        ),
        const Row(children: [EngagementUpWidget(), CustomCreatePostWidget()]),
      ],
    );
  }
}
