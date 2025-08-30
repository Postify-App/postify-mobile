import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../images/app_images.dart';
import '../../locale/app_locale_key.dart';
import '../../theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseGalleryOrCameraBottomSheet extends StatelessWidget {
  final void Function()? onCamera;
  final void Function()? onGallery;
  const ChooseGalleryOrCameraBottomSheet({
    super.key,
    this.onCamera,
    this.onGallery,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.popupColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: 40,
            child: Divider(color: AppColor.hintColor(context)),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextButton(
                    onPressed: onCamera,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.assetsGlobalIconCamera,
                          colorFilter: ColorFilter.mode(
                            AppColor.mainAppColor(context),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          AppLocaleKey.camera.tr(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainAppColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.hintColor(context),
                  ),
                  TextButton(
                    onPressed: onGallery,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.assetsGlobalIconGallery,
                          colorFilter: ColorFilter.mode(
                            AppColor.mainAppColor(context),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          tr(AppLocaleKey.gallery),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainAppColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
