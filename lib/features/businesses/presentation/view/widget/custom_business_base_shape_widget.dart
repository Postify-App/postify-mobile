import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_social_shape_widget.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_suffix_circle_icon.dart';

class CustomBusinessBaseShapeWidget extends StatelessWidget {
  const CustomBusinessBaseShapeWidget({super.key, required this.businessModel});
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        // const CustomSocialShapeWidget(),
        // Positioned(
        //   right: 0,
        //   bottom: 30,
        //   child: Stack(
        //     alignment: Alignment.center,
        //     children: [
        //       Image.asset(AppImages.assetsImagesOpenShape),
        //       Positioned(
        //         bottom: 15,
        //         child: Text(
        //           AppLocaleKey.open.tr(),
        //           style: AppTextStyle.text18MSecond(context),
        //         ),
        //       ),
        //       Positioned(
        //         top: 20,
        //         right: 15,
        //         child: SvgPicture.asset(AppImages.assetsSvgOpen),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
