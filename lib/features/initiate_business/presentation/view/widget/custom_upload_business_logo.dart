import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/images/media_methods.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';

class CustomUploadBusinessLogo extends StatelessWidget {
  const CustomUploadBusinessLogo({super.key, required this.selectedLogo});

  final ValueNotifier<File?> selectedLogo;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedLogo,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColor.lightMainAppColor(context),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColor.lightMainAppColor(context),
              border: Border.all(color: AppColor.secondAppColor(context)),
            ),
            child: Center(
              child: selectedLogo.value == null
                  ? Column(
                      children: [
                        Image.asset(AppImages.assetsImagesUploadLogo),
                        Text(
                          AppLocaleKey.uploadLogo.tr(),
                          style: AppTextStyle.text16RSecond(context),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(selectedLogo.value!.path),
                        fit: BoxFit.cover,
                        height: 50.h,
                        width: 50.w,
                      ),
                    ),
            ),
          ),
        ).onTapScaleAnimation(
          onTap: () {
            MediaMethods.pickImageBottomSheet(
              context,
              onSuccessCamera: (file) {
                Navigator.pop(context);
                selectedLogo.value = file;
                context.read<InitiateBusinessCubit>().setBusinessInfo(
                  logo: file,
                );
              },
              onSuccessGallery: (files) {
                Navigator.pop(context);
                selectedLogo.value = files.first;
                context.read<InitiateBusinessCubit>().setBusinessInfo(
                  logo: files.first,
                );
              },
            );
          },
        );
      },
    );
  }
}
