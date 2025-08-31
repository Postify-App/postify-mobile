import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_otp_field.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/auth/presentation/view/widget/custom_auth_header.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                      CustomOtpField(
                        length: 6,
                        fieldWidth: 60,
                        fieldHeight: 60,
                        spacing: 20,
                        showNumbers: false,
                        onCompleted: (code) {
                          print('OTP Completed: $code');
                        },
                      ),
                      54.verticalSpace,
                      CustomButton(text: AppLocaleKey.verify.tr()),
                      18.verticalSpace,
                      Center(
                        child: FadeInUpBig(
                          from: 30,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            AppLocaleKey.sendNewCode.tr(),
                            style: AppTextStyle.text14RMain(context),
                          ),
                        ),
                      ),
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
