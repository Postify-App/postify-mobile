import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/custom_widgets/buttons/custom_button.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:postify/core/locale/app_locale_key.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: PageView.builder(
        controller: _pageController,
        itemCount: onBoardingList.length,
        onPageChanged: (index) {
          _currentIndex.value = index;
        },
        itemBuilder: (context, index) {
          final item = onBoardingList[index];
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 600),
                child: Image.asset(item.image, fit: BoxFit.cover),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 72,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor(context),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentIndex,
                    builder: (context, currentIndex, _) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInDown(
                            from: 30,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              item.title.tr(),
                              style: AppTextStyle.text28SBMain(context),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          FadeInUp(
                            from: 30,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              item.description.tr(),
                              style: AppTextStyle.text16RSecond(context),
                            ),
                          ),
                          100.verticalSpace,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 147,
                                height: 57,
                                text: currentIndex == onBoardingList.length - 1
                                    ? AppLocaleKey.getStarted.tr()
                                    : AppLocaleKey.continueKey.tr(),
                                onPressed: () {
                                  if (currentIndex ==
                                      onBoardingList.length - 1) {
                                    NavigatorMethods.pushNamed(
                                      context,
                                      RoutesName.loginScreen,
                                    );
                                    HiveMethods.updateFirstTime();
                                  } else {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                              ),
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: onBoardingList.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.deepPurple,
                                  dotHeight: 8.h,
                                  dotWidth: 8.w,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
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
