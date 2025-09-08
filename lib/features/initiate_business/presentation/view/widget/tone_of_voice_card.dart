import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';

class ToneOfVoiceCard extends StatelessWidget {
  const ToneOfVoiceCard({
    super.key,
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  final InitiateGeneralModel model;
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
              model.title ?? '',
              style: isSelected
                  ? AppTextStyle.text22BSecond(context)
                  : AppTextStyle.text22BLightMain(context),
            ),
          ),
          CustomSuffixCircleIcon(icon: model.logo),
        ],
      ),
    ).onTapScaleAnimation(onTap: onTap);
  }
}
