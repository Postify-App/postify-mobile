import 'package:flutter/material.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/page/custom_initiate_business_step_page.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_initiate_back_button.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_smooth_indicator.dart';

class InitiateBusinessScreen extends StatefulWidget {
  const InitiateBusinessScreen({super.key});

  @override
  State<InitiateBusinessScreen> createState() => _InitiateBusinessScreenState();
}

class _InitiateBusinessScreenState extends State<InitiateBusinessScreen> {
  final PageController _pageController = PageController();
  ValueNotifier<int> currentPageNotifier = ValueNotifier(0);

  final List<InitiateBusinessStepType> _steps = [
    InitiateBusinessStepType.topic,
    InitiateBusinessStepType.tone,
    InitiateBusinessStepType.target,
    InitiateBusinessStepType.businessInfo,
    InitiateBusinessStepType.social,
  ];

  void _nextPage() {
    if (currentPageNotifier.value < _steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (currentPageNotifier.value > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.assetsImagesGlassEffect,
                fit: BoxFit.fill,
              ),
            ),
            CustomInitiateBusinessBackButton(onPressed: _previousPage),
            ValueListenableBuilder(
              valueListenable: currentPageNotifier,
              builder: (context, value, child) {
                return CustomSmoothIndicator(
                  steps: _steps,
                  currentPage: currentPageNotifier.value,
                );
              },
            ),
            Positioned(
              top: 100,
              left: 10,
              right: 10,
              bottom: 0,
              child: ValueListenableBuilder(
                valueListenable: currentPageNotifier,
                builder: (context, value, child) {
                  return PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      currentPageNotifier.value = index;
                    },
                    itemCount: _steps.length,
                    itemBuilder: (context, index) {
                      return CustomInitiateBusinessStepPage(
                        step: _steps[index],
                        steps: _steps,
                        currentPage: currentPageNotifier.value,
                        nextPage: _nextPage,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
