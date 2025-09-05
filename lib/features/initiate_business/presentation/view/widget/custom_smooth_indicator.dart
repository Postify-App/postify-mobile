import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required List<InitiateBusinessStepType> steps,
    required int currentPage,
  }) : _steps = steps,
       _currentPage = currentPage;

  final List<InitiateBusinessStepType> _steps;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.h,
      right: 60.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _steps.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 16,
            height: index == _currentPage ? 30 : 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index <= _currentPage
                  ? AppColor.greenColor(context)
                  : AppColor.greyColor(context).withValues(alpha: .5),
            ),
          ),
        ),
      ),
    );
  }
}
