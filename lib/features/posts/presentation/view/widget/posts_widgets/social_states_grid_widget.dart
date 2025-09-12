import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/posts/data/model/social_states_model.dart';

class SocialStatsWrapWidget extends StatelessWidget {
  const SocialStatsWrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24.w,
      runSpacing: 16.h,
      children: mockSocialStats.map((stat) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width / 2) - 36.w,
          child:
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(stat.icon, width: 28.w, height: 28.h),
                      8.horizontalSpace,
                      Text(stat.title),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(stat.value),
                      8.horizontalSpace,
                      Icon(
                        stat.isIncrease
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 16.w,
                        color: stat.isIncrease ? Colors.green : Colors.red,
                      ),
                      Text("${stat.percentage}%"),
                    ],
                  ),
                ],
              ).setContainerToView(
                color: AppColor.secondPrimaryColor(context),
                radius: 12,
                padding: const EdgeInsets.all(8),
                borderColor: AppColor.darkTextColor(context),
              ),
        );
      }).toList(),
    );
  }
}
