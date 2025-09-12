import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/constants.dart';

class CustomPostDetailsCardWidget extends StatelessWidget {
  const CustomPostDetailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomNetworkImage(
          imageUrl: Constants.testNoonLogo,
          height: 189,
          width: double.infinity,
          radius: 10,
          fit: BoxFit.cover,
        ),
        16.verticalSpace,
        Text(
          'Introducing Our New Summer Collection',
          style: AppTextStyle.text16MDark(context),
        ),
        8.verticalSpace,
        Text(description, style: AppTextStyle.text13RDark(context)),
        8.verticalSpace,
        Text(
          '#SummerStyle  #NewCollection ',
          style: AppTextStyle.text13RDark(context),
        ),
      ],
    ).setContainerToView(
      padding: const EdgeInsets.all(16),
      shadows: [
        const BoxShadow(
          color: Color(0xFF3A3A3A),
          blurRadius: 0,
          offset: Offset(-2, 5),
          spreadRadius: 0,
        ),
        const BoxShadow(
          color: Color(0x59000000),
          blurRadius: 50,
          offset: Offset(0, 0),
          spreadRadius: -25,
        ),
      ],
      borderColor: AppColor.secondAppColor(context),
      radius: 12,
      color: AppColor.lightMainAppColor(context),
      margin: const EdgeInsets.only(top: 16, bottom: 24),
      width: double.infinity,
    );
  }
}

final String description =
    "Stay stylish this season 🌸 with our latest drop — designed for comfort 😌, confidence 💪, and everyday wear 👟. From bold colors 🎨 to timeless basics 🖤, there’s something for everyone. Available now 🛒 online and in stores 🏬. Don’t miss out! 🚀";
