import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/auth/presentation/view/widget/custom_auth_header.dart';
import 'package:postify/features/auth/presentation/view/widget/or_widget.dart';
import 'package:postify/features/auth/presentation/view/widget/sign_in_with_google_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                        title: AppLocaleKey.signUp.tr(),
                        description: AppLocaleKey.signUpDesc.tr(),
                      ),
                      54.verticalSpace,
                      CustomFormField(
                        hintText: AppLocaleKey.enterYourName.tr(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppImages.assetsSvgNameFeild),
                        ),
                      ),
                      32.verticalSpace,
                      CustomFormField(
                        hintText: AppLocaleKey.enterYourEmail.tr(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            AppImages.assetsSvgEmailFeild,
                          ),
                        ),
                      ),
                      32.verticalSpace,
                      CustomButton(
                        text: AppLocaleKey.signUp.tr(),
                        onPressed: () {
                          NavigatorMethods.pushNamed(
                            context,
                            RoutesName.otpScreen,
                          );
                        },
                      ),
                      47.verticalSpace,
                      const OrWidget(),
                      24.verticalSpace,
                      const SigninWithGoogleWidget(),
                      50.verticalSpace,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocaleKey.haveAnAccount.tr(),
                                style: AppTextStyle.text16RSecond(context),
                              ),
                              const TextSpan(text: ' '),
                              TextSpan(
                                text: AppLocaleKey.signIn.tr(),
                                style: AppTextStyle.text16RMain(context),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pop(context),
                              ),
                            ],
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
