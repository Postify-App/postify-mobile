import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/home/presentation/view/widget/custom_arrows_switcher_widget.dart';
import 'package:postify/features/posts/presentation/controller/posts_cubit.dart';
import 'package:postify/features/posts/presentation/view/widget/posts_widgets/custom_post_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScheduledPostsListWidget extends StatefulWidget {
  const ScheduledPostsListWidget({super.key, required this.businessId});
  final String businessId;

  @override
  State<ScheduledPostsListWidget> createState() =>
      _ScheduledPostsListWidgetState();
}

class _ScheduledPostsListWidgetState extends State<ScheduledPostsListWidget> {
  final ValueNotifier<int> activeIndex = ValueNotifier<int>(0);
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  initState() {
    super.initState();
    context.read<PostsCubit>().getScheduledPosts(businessId: widget.businessId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocaleKey.scheduled.tr(),
              style: AppTextStyle.text32BDark(context),
            ),
            CustomArrowsSwitcherWidget(
              size: 18,
              arrowLeftOnTap: () {
                if (activeIndex.value > 0) {
                  activeIndex.value--;
                  _carouselController.previousPage();
                }
              },
              arrowRightOnTap: () {
                if (activeIndex.value < 4) {
                  activeIndex.value++;
                  _carouselController.nextPage();
                }
              },
            ),
          ],
        ),
        16.verticalSpace,

        BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            return ApiResponseWidget(
              cubitState: state.getScheduledPostsStatus,
              isEmpty: state.scheduledPosts.isEmpty,
              onReload: () => context.read<PostsCubit>().getScheduledPosts(
                businessId: widget.businessId,
              ),

              child: FractionallySizedBox(
                widthFactor: 1.35.w,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: state.scheduledPosts.length,
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomPostWidget(
                            post: state.scheduledPosts[index],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 350.h,
                        onPageChanged: (index, reason) {
                          activeIndex.value = index;
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),

                    ValueListenableBuilder<int>(
                      valueListenable: activeIndex,
                      builder: (context, value, _) {
                        return AnimatedSmoothIndicator(
                          activeIndex: value,
                          count: state.scheduledPosts.length,
                          effect: WormEffect(
                            activeDotColor: AppColor.darkTextColor(context),
                            dotColor: AppColor.secondPrimaryColor(context),
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

final text =
    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups laboris nisi ut aliquip ex ea ..';
