import 'package:flutter/material.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/posts/data/enum/post_writing_type_enum.dart';

class PostWritingTypeTapWidget extends StatelessWidget {
  const PostWritingTypeTapWidget({
    super.key,
    required this.tapName,
    required this.onTap,
    required this.isSelected,
  });
  final PostWritingTypeEnum tapName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.darkTextColor(context)
            : AppColor.lightMainAppColor(context),
        border: Border.all(
          color: isSelected
              ? AppColor.lightMainAppColor(context)
              : AppColor.darkTextColor(context),
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: isSelected
            ? const [
                BoxShadow(
                  color: Color(0xFF3A3A3A),
                  blurRadius: 0,
                  offset: Offset(-2, 5),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x59000000),
                  blurRadius: 50,
                  offset: Offset(0, 0),
                  spreadRadius: -25,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          tapName.value,
          style: isSelected
              ? AppTextStyle.text16RWhite(context)
              : AppTextStyle.text16RDark(context),
        ),
      ),
    ).onTapScaleAnimation(onTap: onTap);
  }
}
