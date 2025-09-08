import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/theme/app_colors.dart';

class CustomSuffixCircleIcon extends StatelessWidget {
  const CustomSuffixCircleIcon({
    super.key,
     this.icon,
  });

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
        child: SvgPicture.network(
          icon ?? '',
          placeholderBuilder: (context) =>
              const CupertinoActivityIndicator(),
          colorFilter: ColorFilter.mode(
            AppColor.blackColor(context),
            BlendMode.srcIn,
          ),
          width: 20,
          height: 20,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
