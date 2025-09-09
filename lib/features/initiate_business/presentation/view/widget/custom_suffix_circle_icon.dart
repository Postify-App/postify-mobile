import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:postify/core/theme/app_colors.dart';

class CustomSuffixCircleIcon extends StatelessWidget {
  const CustomSuffixCircleIcon({super.key, this.icon});

  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: CustomNetworkImage(imageUrl: icon ?? "", isSvg: true),
      ),
    );
  }
}
