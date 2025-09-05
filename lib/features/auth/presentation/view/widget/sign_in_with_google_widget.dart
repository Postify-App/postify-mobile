import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/auth/presentation/controller/auth_cubit.dart';

class SigninWithGoogleWidget extends StatelessWidget {
  const SigninWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.signInWithGoogleStatus != current.signInWithGoogleStatus,
      listenWhen: (previous, current) =>
          previous.signInWithGoogleStatus != current.signInWithGoogleStatus,
      listener: (context, state) {
        if (state.signInWithGoogleStatus == CubitStatus.failure) {
          CommonMethods.showError(message: state.errorMessage);
        } else if (state.signInWithGoogleStatus == CubitStatus.success) {
          NavigatorMethods.pushNamedAndRemoveUntil(
            context,
            RoutesName.homeScreen,
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state.signInWithGoogleStatus == CubitStatus.loading;
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isLoading
                ? AppColor.lightGreyColor(context)
                : AppColor.whiteColor(context),
            border: Border.all(color: AppColor.borderColor(context)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: isLoading
              ? const Center(child: CupertinoActivityIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.assetsSvgGoogleLogo),
                    16.horizontalSpace,
                    FadeInLeft(
                      from: 30,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        AppLocaleKey.signInWithGoogle.tr(),
                        style: AppTextStyle.text14RSecond(context),
                      ),
                    ),
                  ],
                ),
        ).onTapScaleAnimation(
          onTap: () {
            if (!isLoading) {
              context.read<AuthCubit>().signInWithGoogle();
            }
          },
        );
      },
    );
  }
}
