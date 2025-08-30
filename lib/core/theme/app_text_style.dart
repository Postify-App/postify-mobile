import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle appBarStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Vazirmatn',
      color: AppColor.appBarTextColor(context, listen: listen),
    );
  }

  static TextStyle buttonStyle(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.buttonTextColor(context, listen: listen),
    );
  }

  static TextStyle hintStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.hintColor(context, listen: listen),
    );
  }

  static TextStyle textFormStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.textFormColor(context, listen: listen),
    );
  }

  static TextStyle formTitleStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.titleFormFiledColor(context, listen: listen),
    );
  }

  static TextStyle text12MDarkGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12RDarkGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text10RDarkGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text10LDarkGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12LDarkGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkGreyColor(context, listen: listen),
    );
  }

  static TextStyle text12RDark(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12MDark(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14RDark(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14MDark(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12RMain(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text12MMain(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text16SemiMain(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }

  static TextStyle text20SSecond(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text16MSecond(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text18SSecond(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text12RBlack(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text12MBlack(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text14MBlack(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor(context, listen: listen),
    );
  }

  static TextStyle text16MWhite(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text12RWhite(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.whiteColor(context, listen: listen),
    );
  }

  static TextStyle text10RGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.greyColor(context, listen: listen),
    );
  }

  static TextStyle text12RGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.greyColor(context, listen: listen),
    );
  }

  static TextStyle text16MRed(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.redColor(context, listen: listen),
    );
  }

  static TextStyle text12RRed(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.redColor(context, listen: listen),
    );
  }

  static TextStyle text12SM(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16SBMain(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.mainAppColor(context, listen: listen),
    );
  }
 static  TextStyle text12RLightGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.lightGreyColor(context, listen: listen),
    );
  } 
  static  TextStyle text10LLightGrey(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.lightGreyColor(context, listen: listen),
    );
  }
  static  TextStyle text14BSecond(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

/*


  static TextStyle text22B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text20BD(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
  static TextStyle text20SM(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
  

  static TextStyle text18B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text10B(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text18M(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16M(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14M(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

 

  static TextStyle text10M(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text18R(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text16R(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text14R(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text12R(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }

  static TextStyle text10R(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
  static TextStyle text10L(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
  static TextStyle text12L(BuildContext context,
      {bool listen = true, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.darkTextColor(context, listen: listen),
    );
  }
  */
}
