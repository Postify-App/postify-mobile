import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/services/service_locator.imports.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/businesses/presentation/controller/businesses_cubit.dart';
import 'package:postify/features/businesses/presentation/view/screen/your_businesses_screen.dart';
import 'package:postify/features/businesses/presentation/view/widget/businesses_list_widget.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_initiate_shape_widget.dart';
import 'package:postify/features/businesses/presentation/view/widget/wavy_background_widget.dart';

class BusinessesScreen extends StatelessWidget {
  const BusinessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BusinessesCubit>()..getBusinesses(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColor.mainAppColor(context),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned.fill(child: LiquidGlassBackground()),
                  Positioned(
                    top: 25.h,
                    left: 10.w,
                    child: Image.asset(AppImages.assetsImagesHomeLogo),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomHomeButton(
                              text: AppLocaleKey.yourBusinesses.tr(),
                              prefixIcon: SvgPicture.asset(
                                AppImages.assetsSvgArrowRight,
                              ),
                              width: 200.w,
                              borderColor: AppColor.whiteColor(context),
                              hasShadow: true,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<BusinessesCubit>(),
                                    child: const YourBusinessesScreen(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        50.verticalSpace,
                        const CustomInitiateSectionWidget(),
                        const BusinessesListWidget(),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 35.h,
                    left: 35.w,
                    child: CustomHomeButton(
                      text: AppLocaleKey.logout.tr(),
                      width: 100.w,
                      height: 48.h,
                      color: AppColor.greenColor(context),
                      textColor: AppColor.blackColor(context),
                      hasShadow: true,
                      onPressed: () {
                        HiveMethods.deleteTokens();
                        NavigatorMethods.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.loginScreen,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 15.h,
                    right: 15.w,
                    child: CustomHomeButton(
                      text: AppLocaleKey.recommendation.tr(),
                      suffixIcon: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.secondAppColor(context),
                        child: SvgPicture.asset(AppImages.assetsSvgArrowRight),
                      ),
                      width: 213.w,
                      height: 48.h,
                      color: AppColor.greenColor(context),
                      textColor: AppColor.blackColor(context),
                      hasShadow: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: context.read<BusinessesCubit>(),
                              child: const YourBusinessesScreen(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
