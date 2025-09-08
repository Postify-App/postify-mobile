import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/businesses/presentation/view/widget/businesses_list_widget.dart';
import 'package:postify/features/businesses/presentation/view/widget/wavy_background_widget.dart';

class YourBusinessesScreen extends StatelessWidget {
  const YourBusinessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor(context),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            const Positioned.fill(child: LiquidGlassBackground()),
            Positioned(
              top: 25.h,
              left: 10.w,
              child: Image.asset(AppImages.assetsImagesHomeLogo),
            ),
            50.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Column(
                children: [const BusinessesListWidget(), 60.verticalSpace],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
