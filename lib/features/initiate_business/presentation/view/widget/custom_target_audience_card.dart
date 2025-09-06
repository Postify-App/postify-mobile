import 'package:flutter/material.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomTargetAudienceCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTargetAudienceCard({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.lightMainAppColor(context)
            : Colors.black.withValues(alpha: .4),
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: isSelected
            ? AppTextStyle.text14SSecond(context)
            : AppTextStyle.text14SLightMain(context),
      ),
    ).onTapScaleAnimation(onTap: onTap);
  }
}
