import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle appBarStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: AppColor.appBarTextColor(context, listen: listen),
    );
  }

  static TextStyle buttonStyle(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.buttonTextColor(context, listen: listen),
    );
  }

  static TextStyle hintStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.hintColor(context, listen: listen),
    );
  }

  static TextStyle textFormStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textFormColor(context, listen: listen),
    );
  }

  static TextStyle formTitleStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.titleFormFiledColor(context, listen: listen),
    );
  }

  static TextStyle text12MDarkGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12RDarkGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text10RDarkGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text10LDarkGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12LDarkGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12RDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12MDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14RDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14RSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text14RMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text14MDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12RMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text12MMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text16SemiMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text16RSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text16RGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.greyColor(context, listen: listen),
    );
  }

  static TextStyle text16RWhite(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text16RMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text20SSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text20MDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16MSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text18SSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text18MSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text18BlackSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w900,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text8BDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 8.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12RBlack(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text12MBlack(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text14MBlack(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text16MWhite(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text12RWhite(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text10RGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.greyColor(context, listen: listen),
    );
  }

  static TextStyle text10SBDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12RGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.greyColor(context, listen: listen),
    );
  }

  static TextStyle text16MRed(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.redColor(context, listen: listen),
    );
  }

  static TextStyle text12RRed(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.redColor(context, listen: listen),
    );
  }

  static TextStyle text12SM(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16SBMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text16BSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text12RLightGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.lightGreyColor(context, listen: listen),
    );
  }

  static TextStyle text10LLightGrey(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 10.sp.sp,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.lightGreyColor(context, listen: listen),
    );
  }

  static TextStyle text14BSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text14SSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text14SLightMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.lightMainAppColor(context, listen: listen),
    );
  }

  static TextStyle text28SBMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text32BSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text32SBDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text32SBDarkGreen(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkGreenColor(context, listen: listen),
    );
  }

  static TextStyle text28SBWhite(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text40LightSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text40SBSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text40BWhite(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text22BLightMain(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.lightMainAppColor(context, listen: listen),
    );
  }

  static TextStyle text22BSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text6SBSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 6.sp,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text24BDark(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
}
