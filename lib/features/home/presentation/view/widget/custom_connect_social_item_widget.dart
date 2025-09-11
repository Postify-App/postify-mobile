import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/data/model/connect_socials_model.dart';

class CustomConnectSocialsItemWidget extends StatelessWidget {
  const CustomConnectSocialsItemWidget({
    super.key,
    required this.connectSocialsModel,
  });
  final ConnectSocialsModel connectSocialsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColor.secondPrimaryColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
          ),
          side: BorderSide(color: AppColor.darkTextColor(context), width: 1),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColor.darkTextColor(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomNetworkImage(
                  imageUrl: connectSocialsModel.userSocialImage,
                  radius: 100,
                  isSvg: true,
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Text(
            connectSocialsModel.userSocialName,
            style: AppTextStyle.text10SBDark(context),
            maxLines: 1,
          ),
          Divider(color: AppColor.darkTextColor(context), thickness: 1),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    connectSocialsModel.socialName,
                    style: AppTextStyle.text10RDarkGrey(
                      context,
                      color: AppColor.darkTextColor(context),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(connectSocialsModel.socialIcon, height: 15),
                ],
              ),
              4.verticalSpace,
              Row(
                children: [
                  Text(
                    AppLocaleKey.posts.tr(),
                    style: AppTextStyle.text10RDarkGrey(
                      context,
                      color: AppColor.darkTextColor(context),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    connectSocialsModel.postsCount.toString(),
                    style: AppTextStyle.text10RDarkGrey(
                      context,
                      color: AppColor.darkTextColor(context),
                    ),
                  ),
                  4.horizontalSpace,
                  SvgPicture.asset(AppImages.assetsSvgPosts),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
