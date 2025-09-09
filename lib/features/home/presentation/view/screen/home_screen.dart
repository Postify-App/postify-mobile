import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                height: 500.h,
                width: double.infinity,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, 0.00),
                    end: const Alignment(1.00, 1.00),
                    colors: [
                      AppColor.lightMainAppColor(context),
                      AppColor.mainAppColor(context).withValues(alpha: 0.1),
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
