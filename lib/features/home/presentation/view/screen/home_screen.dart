import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_main_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightMainAppColor(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const CustomHomeAppBar(),
              24.verticalSpace,
              const CustomHomeMainSection(),
            ],
          ),
        ),
      ),
    );
  }
}
