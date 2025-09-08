import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/businesses/data/model/business_model.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_business_base_shape_widget.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_social_shape_widget.dart';

class CustomBusinessCardSectionWidget extends StatelessWidget {
  const CustomBusinessCardSectionWidget({
    super.key,
    required this.businessModel,
  });
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomBusinessBaseShapeWidget(businessModel: businessModel),
          const CustomSocialShapeWidget(),
          Positioned(
            right: 0,
            bottom: -50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImages.assetsImagesOpenShape),
                Positioned(
                  bottom: 15,
                  child: Text(
                    AppLocaleKey.open.tr(),
                    style: AppTextStyle.text18MSecond(context),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 15,
                  child: SvgPicture.asset(AppImages.assetsSvgOpen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
