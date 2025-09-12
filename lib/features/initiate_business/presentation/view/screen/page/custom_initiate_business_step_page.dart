import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';
import 'package:postify/features/initiate_business/data/extension/initiate_business_step_extension.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/profile/presentation/controller/profile_cubit.dart';

class CustomInitiateBusinessStepPage extends StatelessWidget {
  const CustomInitiateBusinessStepPage({
    super.key,
    required this.step,
    required this.steps,
    required this.currentPage,
    required this.nextPage,
  });
  final InitiateBusinessStepType step;
  final List<InitiateBusinessStepType> steps;
  final int currentPage;
  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(step.title, style: AppTextStyle.text28SBWhite(context)),
          const SizedBox(height: 8),
          Text(step.subtitle, style: AppTextStyle.text16MWhite(context)),
          Expanded(child: step.content),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocConsumer<InitiateBusinessCubit, InitiateBusinessState>(
                listenWhen: (previous, current) =>
                    previous.createBusinessStatus !=
                    current.createBusinessStatus,
                listener: (context, state) {
                  if (state.createBusinessStatus == CubitStatus.success) {
                    context.read<ProfileCubit>().updateSelectedBusiness(
                      state.businessModel,
                    );
                    NavigatorMethods.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.bottomNavBar,
                    );
                  }
                  if (state.createBusinessStatus == CubitStatus.failure) {
                    CommonMethods.showError(message: state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return CustomHomeButton(
                    cubitState: state.createBusinessStatus,
                    text: currentPage == steps.length - 1
                        ? AppLocaleKey.done.tr()
                        : AppLocaleKey.continueKey.tr(),
                    color: AppColor.greenColor(context),
                    style: AppTextStyle.text16BSecond(context),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImages.assetsSvgArrowRight,
                        colorFilter: ColorFilter.mode(
                          AppColor.secondAppColor(context),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    onPressed: nextPage,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
