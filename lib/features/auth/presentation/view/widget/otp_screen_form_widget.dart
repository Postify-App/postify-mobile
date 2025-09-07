import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_otp_field.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/services/service_locator.imports.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/auth/data/model/auth_body_model.dart';
import 'package:postify/features/auth/presentation/controller/auth_cubit.dart';
import 'package:postify/features/auth/presentation/view/screen/otp_screen.dart';

class OtpScreenFormWidget extends StatefulWidget {
  const OtpScreenFormWidget({super.key, required this.args});
  final OtpScreenArgs args;

  @override
  State<OtpScreenFormWidget> createState() => _OtpScreenFormWidgetState();
}

class _OtpScreenFormWidgetState extends State<OtpScreenFormWidget> {
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isResendActive = ValueNotifier<bool>(true);
  final ValueNotifier<int> countdown = ValueNotifier<int>(30);

  Timer? _timer;

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    isResendActive.dispose();
    countdown.dispose();
    super.dispose();
  }

  void startResendCountdown() {
    isResendActive.value = false;
    countdown.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        timer.cancel();
        isResendActive.value = true;
      } else {
        countdown.value = countdown.value - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AuthCubit, AuthState>(
            buildWhen: (previous, current) =>
                previous.verifyOtpStatus != current.verifyOtpStatus,
            listenWhen: (previous, current) =>
                previous.verifyOtpStatus != current.verifyOtpStatus,
            listener: (context, state) {
              if (state.verifyOtpStatus == CubitStatus.failure) {
                CommonMethods.showError(message: state.errorMessage);
              } else if (state.verifyOtpStatus == CubitStatus.success) {
                NavigatorMethods.pushNamed(
                  context,
                  RoutesName.businessesScreen,
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomOtpField(
                    length: 6,
                    fieldWidth: 60,
                    fieldHeight: 60,
                    spacing: 20,
                    showNumbers: false,
                    onCompleted: (code) {
                      context.read<AuthCubit>().verifyOtp(
                        AuthBodyModel(
                          email: widget.args.email,
                          name: widget.args.name,
                          otp: code,
                        ),
                      );
                    },
                    controller: otpController,
                  ),
                  54.verticalSpace,
                  CustomButton(
                    isEnabled: otpController.text.length == 6,
                    cubitState: state.verifyOtpStatus,
                    text: AppLocaleKey.verify.tr(),
                    onPressed: () {
                      context.read<AuthCubit>().verifyOtp(
                        AuthBodyModel(
                          email: widget.args.email,
                          name: widget.args.name,
                          otp: otpController.text,
                        ),
                      );
                    },
                  ),
                  18.verticalSpace,
                  Center(
                    child: FadeInUpBig(
                      from: 30,
                      duration: const Duration(milliseconds: 500),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isResendActive,
                        builder: (context, active, _) {
                          return GestureDetector(
                            onTap: active
                                ? () {
                                    context.read<AuthCubit>().login(
                                      AuthBodyModel(
                                        email: widget.args.email,
                                        name: widget.args.name,
                                      ),
                                    );
                                    startResendCountdown();
                                  }
                                : null,
                            child: ValueListenableBuilder<int>(
                              valueListenable: countdown,
                              builder: (context, time, _) {
                                return Text(
                                  active
                                      ? AppLocaleKey.sendNewCode.tr()
                                      : "${AppLocaleKey.sendNewCode.tr()} ($time s)",
                                  style: AppTextStyle.text14RMain(context)
                                      .copyWith(
                                        color: active
                                            ? AppColor.mainAppColor(context)
                                            : AppColor.greyColor(context),
                                      ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
