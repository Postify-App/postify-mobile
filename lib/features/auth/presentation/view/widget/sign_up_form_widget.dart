import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/custom_widgets/validation/validation_mixin.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/services/service_locator.imports.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/auth/data/model/auth_body_model.dart';
import 'package:postify/features/auth/presentation/controller/auth_cubit.dart';
import 'package:postify/features/auth/presentation/view/screen/otp_screen.dart';
import 'package:postify/features/auth/presentation/view/widget/or_widget.dart';
import 'package:postify/features/auth/presentation/view/widget/sign_in_with_google_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget>
    with ValidationMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  ValueNotifier<bool> isFormValid = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    isFormValid.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Form(
        key: formKey,
        onChanged: () {
          final isValid = formKey.currentState?.validate() ?? false;
          if (isValid != isFormValid.value) {
            isFormValid.value = isValid;
          }
        },
        child: Column(
          children: [
            CustomFormField(
              hintText: AppLocaleKey.enterYourName.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImages.assetsSvgNameFeild),
              ),
              controller: nameController,
              validator: validateName,
            ),
            32.verticalSpace,
            CustomFormField(
              hintText: AppLocaleKey.enterYourEmail.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImages.assetsSvgEmailFeild),
              ),
              controller: emailController,
              validator: validateEmail,
            ),
            32.verticalSpace,
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  previous.registerStatus != current.registerStatus,
              buildWhen: (previous, current) =>
                  previous.registerStatus != current.registerStatus,
              listener: (context, state) {
                if (state.registerStatus == CubitStatus.failure) {
                  CommonMethods.showError(message: state.errorMessage);
                } else if (state.loginStatus == CubitStatus.success) {
                  NavigatorMethods.pushNamed(
                    context,
                    RoutesName.otpScreen,
                    arguments: OtpScreenArgs(
                      email: emailController.text,
                      name: nameController.text,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: isFormValid,
                  builder: (context, value, child) {
                    return CustomButton(
                      isEnabled: value,
                      cubitState: state.registerStatus,
                      text: AppLocaleKey.signUp.tr(),
                      onPressed: () {
                        context.read<AuthCubit>().register(
                          AuthBodyModel(
                            email: emailController.text,
                            name: nameController.text,
                          ),
                        );
                      },
                    );
                  },
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
    );
  }
}
