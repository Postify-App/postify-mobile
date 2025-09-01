import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_otp_field.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/services/service_locator.imports.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
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

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Builder(
        builder: (context) {
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
              BlocConsumer<AuthCubit, AuthState>(
                listenWhen: (previous, current) =>
                    previous.verifyOtpStatus != current.verifyOtpStatus,
                buildWhen: (previous, current) =>
                    previous.verifyOtpStatus != current.verifyOtpStatus,
                listener: (context, state) {
                  if (state.verifyOtpStatus == CubitStatus.failure) {
                    CommonMethods.showError(message: state.errorMessage);
                  } else if (state.verifyOtpStatus == CubitStatus.success) {
                    //! Navigate to home screen
                  }
                },
                builder: (context, state) {
                  return CustomButton(
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
                  );
                },
              ),
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
          );
        },
      ),
    );
  }
}
