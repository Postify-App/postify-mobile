import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomAuthHeader extends StatelessWidget {
  const CustomAuthHeader({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          from: 30,
          duration: const Duration(milliseconds: 500),
          child: Text(title, style: AppTextStyle.text28SBMain(context)),
        ),
        16.verticalSpace,
        FadeInUp(
          from: 30,
          duration: const Duration(milliseconds: 500),
          child: Text(description, style: AppTextStyle.text16RSecond(context)),
        ),
      ],
    );
  }
}
