import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/auth/presentation/view/widget/custom_auth_header.dart';
import 'package:postify/features/auth/presentation/view/widget/otp_screen_form_widget.dart';

class OtpScreenArgs {
  final String email;
  final String? name;

  OtpScreenArgs({required this.email, this.name});
}

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.args});
  final OtpScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Image.asset(AppImages.assetsImagesAuthTopBackground),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor(context),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAuthHeader(
                        title: AppLocaleKey.verificationCode.tr(),
                        description: AppLocaleKey.enterVerificationCode.tr(),
                      ),
                      171.verticalSpace,
                      OtpScreenFormWidget(args: args),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
