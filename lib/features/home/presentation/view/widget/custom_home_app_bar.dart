import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.assetsImagesHomeLogo,
            width: 116,
            height: 32,
            color: AppColor.mainAppColor(context),
          ),
          SvgPicture.asset(AppImages.assetsSvgMenu),
        ],
      ),
    );
  }
}
