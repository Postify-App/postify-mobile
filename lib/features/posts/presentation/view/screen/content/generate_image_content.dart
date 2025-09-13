import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/services/service_locator.imports.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/bottom_nav_bar/presentation/controller/cubit/bottom_nav_cubit.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/data/model/create_post_body.dart';
import 'package:postify/features/posts/presentation/controller/posts_cubit.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/create_post_header_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/schedule_post_section_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/select_social_platform_section_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/upload_media_widget.dart';
import 'package:postify/features/profile/presentation/controller/profile_cubit.dart';

class GenerateImageContent extends StatefulWidget {
  const GenerateImageContent({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<GenerateImageContent> createState() => _GenerateImageContentState();
}

class _GenerateImageContentState extends State<GenerateImageContent> {
  final ValueNotifier<File?> mediaNotifier = ValueNotifier<File?>(null);
  final ValueNotifier<String?> selectedDateAndTimeNotifier = ValueNotifier(
    null,
  );
  void _goToPreviousPage() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostsCubit>(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeAppBar(),
              16.verticalSpace,
              CustomHeaderWidget(onTap: _goToPreviousPage),
              UploadMediaWidget(mediaNotifier: mediaNotifier),
              CustomHomeButton(
                hasShadow: true,
                text: AppLocaleKey.generateImage.tr(),
                color: AppColor.lightMainAppColor(context),
                borderColor: AppColor.darkTextColor(context),
                style: AppTextStyle.text16SBMain(
                  context,
                  color: AppColor.darkTextColor(context),
                ),
                radius: 10,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AppImages.assetsSvgOpen),
                ),
              ),
              32.verticalSpace,
              Text(
                AppLocaleKey.socialPlatform.tr(),
                style: AppTextStyle.text20MDark(context),
              ),
              Text(
                AppLocaleKey.selectPlatforms.tr(),
                style: AppTextStyle.text13RDark(context),
              ),
              16.verticalSpace,
              const SelectSocialPlatformListWidget(),
              16.verticalSpace,
              SchedulePostSectionWidget(
                selectedDateAndTimeNotifier: selectedDateAndTimeNotifier,
              ),
              const Spacer(),
              BlocConsumer<PostsCubit, PostsState>(
                buildWhen: (previous, current) =>
                    previous.createPostStatus != current.createPostStatus,
                listenWhen: (previous, current) =>
                    previous.createPostStatus != current.createPostStatus,
                listener: (context, state) {
                  if (state.createPostStatus == CubitStatus.failure) {
                    CommonMethods.showError(message: state.errorMessage);
                    NavigatorMethods.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.bottomNavBar,
                    );
                  } else if (state.createPostStatus == CubitStatus.success) {
                    NavigatorMethods.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.bottomNavBar,
                    );
                    context.read<BottomNavCubit>().changeScreen(1);
                  }
                },
                builder: (context, state) {
                  return CustomHomeButton(
                    cubitState: state.createPostStatus,
                    text: AppLocaleKey.done.tr(),
                    color: AppColor.darkTextColor(context),
                    onPressed: () {
                      context.read<PostsCubit>().publishPost(
                        businessId:
                            context
                                .read<ProfileCubit>()
                                .state
                                .selectedBusiness
                                ?.id ??
                            '',
                        body: CreatePostBody(
                          file: mediaNotifier.value,
                          scheduledAt: selectedDateAndTimeNotifier.value,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
