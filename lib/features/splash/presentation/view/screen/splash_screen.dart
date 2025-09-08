import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/custom_widgets/animated/animate_image_widget.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/utils/navigator_methods.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (HiveMethods.isFirstTime()) {
        NavigatorMethods.pushNamedAndRemoveUntil(
          context,
          RoutesName.onBoardingScreen,
        );
      } else if (HiveMethods.getAccessToken() != null) {
        NavigatorMethods.pushNamedAndRemoveUntil(
          context,
          RoutesName.businessesScreen,
        );
      } else {
        NavigatorMethods.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginScreen,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColor.mainAppColor(context)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Center(
              child: AnimatedImageWidget(
                image: AppImages.assetsImagesAppLogo,
                imageType: ImageType.png,
              ),
            ),
            Positioned(
              bottom: 50,
              child: Center(
                child: SpinKitFoldingCube(
                  size: 30,
                  color: AppColor.whiteColor(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
