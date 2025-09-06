import 'package:flutter/material.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/constants.dart';

class CustomBusinessCard extends StatelessWidget {
  const CustomBusinessCard({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.lightMainAppColor(context)
            : AppColor.secondAppColor(context).withValues(alpha: .5),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isSelected
              ? AppColor.lightMainAppColor(context)
              : AppColor.secondAppColor(context).withValues(alpha: .1),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: isSelected
                  ? AppTextStyle.text22BSecond(context)
                  : AppTextStyle.text22BLightMain(context),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.lightMainAppColor(context),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF3A3A3A),
                  blurRadius: 0,
                  offset: Offset(-2, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Center(
              child: CustomNetworkImage(
                imageUrl: Constants.testNoonLogo,
                width: 20,
                height: 20,
                radius: 100,
              ),
            ),
          ),
        ],
      ),
    ).onTapScaleAnimation(onTap: onTap);
  }
}
