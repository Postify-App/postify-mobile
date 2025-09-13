import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/bottom_nav_bar/presentation/controller/cubit/bottom_nav_cubit.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final bottomNavCubit = context.read<BottomNavCubit>();
        final currentIndex = bottomNavCubit.currentIndex;

        return Scaffold(
          extendBody: true,
          backgroundColor: AppColor.lightMainAppColor(context),
          body: LazyIndexedStack(
            index: currentIndex,
            children: bottomNavCubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) async {
              context.read<BottomNavCubit>().changeScreen(index);
            },
            items: [
              _buildBottomNavItem(
                icon: AppImages.assetsSvgHomeNavBar,
                label: AppLocaleKey.home.tr(),
                isSelected: currentIndex == 0,
              ),

              _buildBottomNavItem(
                icon: AppImages.assetsSvgPostsNavBar,
                label: AppLocaleKey.posts.tr(),
                isSelected: currentIndex == 1,
              ),
              const BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              _buildBottomNavItem(
                icon: AppImages.assetsSvgAnalysisNavBar,
                label: AppLocaleKey.analysis.tr(),
                isSelected: currentIndex == 3,
              ),
              _buildBottomNavItem(
                icon: AppImages.assetsSvgCreateNavBar,
                label: AppLocaleKey.create.tr(),
                isSelected: currentIndex == 4,
              ),
            ],
            selectedItemColor: AppColor.darkTextColor(context),
            unselectedItemColor: AppColor.greyColor(context),
            selectedLabelStyle: AppTextStyle.text8BDark(context),
            unselectedLabelStyle: AppTextStyle.text8BDark(
              context,
              color: AppColor.greyColor(context),
            ),
            backgroundColor: AppColor.lightMainAppColor(context),
            type: BottomNavigationBarType.fixed,
          ),

          floatingActionButton: GestureDetector(
            onTap: () {
              context.read<BottomNavCubit>().changeScreen(2);
            },
            child: _buildAnimatedIconHome(
              icon: AppImages.assetsSvgAi,
              isSelected: currentIndex == 2,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _buildAnimatedIconHome({
    required String icon,
    required bool isSelected,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: AppColor.darkGradient(context),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon),
              4.verticalSpace,
              Text(
                AppLocaleKey.assistant.tr(),
                style: AppTextStyle.text8BDark(
                  context,
                  color: AppColor.lightMainAppColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColor.darkTextColor(context)
                      : AppColor.greyColor(context),
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ),
      label: label,
    );
  }
}
