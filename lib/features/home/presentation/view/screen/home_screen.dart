import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.assetsImagesAppLogo,
                    height: 116,
                    color: AppColor.mainAppColor(context),
                  ),
                  SvgPicture.asset(AppImages.assetsSvgMenu),
                ],
              ),
              const CustomHomeMainSection(),
              
            ],
          ),
        ),
      ),
    );
  }
}
