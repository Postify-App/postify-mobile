import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:postify/core/cache/hive/hive_methods.dart';
import 'package:postify/core/custom_widgets/animated/animate_image_widget.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/core/utils/navigator_methods.dart';
import 'package:postify/features/profile/presentation/controller/profile_cubit.dart';

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
        context.read<ProfileCubit>().getProfile();
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
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state.getProfileStatus == CubitStatus.success) {
                    NavigatorMethods.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.businessesScreen,
                    );
                  } else if (state.getProfileStatus == CubitStatus.failure) {
                    CommonMethods.showError(message: state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return state.getProfileStatus == CubitStatus.loading
                      ? Center(
                          child: SpinKitFoldingCube(
                            size: 30,
                            color: AppColor.whiteColor(context),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
