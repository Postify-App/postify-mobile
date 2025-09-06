import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InitiateBusinessCubit(),
      child: Scaffold(
        backgroundColor: AppColor.mainAppColor(context),
        body: SafeArea(
          child: BlocConsumer<InitiateBusinessCubit, InitiateBusinessState>(
            listenWhen: (previous, current) =>
                previous.currentPage != current.currentPage,
            listener: (context, state) {
              _pageController.animateToPage(
                state.currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            builder: (context, state) {
              final cubit = context.read<InitiateBusinessCubit>();

              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppImages.assetsImagesGlassEffect,
                      fit: BoxFit.fill,
                    ),
                  ),
                  CustomInitiateBusinessBackButton(
                    onPressed: () {
                      if (state.currentPage == 0) {
                        Navigator.pop(context);
                      } else {
                        cubit.previousPage();
                      }
                    },
                  ),
                  CustomSmoothIndicator(
                    steps: cubit.steps,
                    currentPage: state.currentPage,
                  ),
                  Positioned(
                    top: 100,
                    left: 10,
                    right: 10,
                    bottom: 0,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        cubit.setPage(index);
                      },
                      itemCount: cubit.steps.length,
                      itemBuilder: (context, index) {
                        return CustomInitiateBusinessStepPage(
                          step: cubit.steps[index],
                          steps: cubit.steps,
                          currentPage: state.currentPage,
                          nextPage: cubit.nextPage,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
