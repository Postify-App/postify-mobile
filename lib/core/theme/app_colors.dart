import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppColor {
  static Color mainAppColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff0B409C),
      dark: const Color(0xff0B409C),
      listen: listen,
    );
  }

  static Color secondAppColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff23120B),
      dark: const Color(0xff23120B),
      listen: listen,
    );
  }

  static Color borderColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffA6A6A6),
      dark: const Color(0xffA6A6A6),
      listen: listen,
    );
  }

  static Color scaffoldColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFF9F9F9),
      dark: const Color(0xFFF9F9F9),
      listen: listen,
    );
  }

  static Color hintColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffA6A6A6),
      dark: const Color(0xffA6A6A6),
      listen: listen,
    );
  }

  static Color darkTextColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFF010917),
      dark: const Color(0xFF010917),
      listen: listen,
    );
  }

  static Color lightTextColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffFFFFFF),
      dark: const Color(0xffFFFFFF),
      listen: listen,
    );
  }

  static Color pinkColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFCE4C4C),
      dark: const Color(0xFFCE4C4C),
      listen: listen,
    );
  }

  static Color greyColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFA5A5A5),
      dark: const Color(0xFFA5A5A5),
      listen: listen,
    );
  }

  static Color titleFormFiledColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFF000627),
      dark: const Color(0xFF000627),
      listen: listen,
    );
  }

  static Color darkGreyColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff404040),
      dark: const Color(0xff404040),
      listen: listen,
    );
  }

  static Color lightGreyColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffA6A6A6),
      dark: const Color(0xffA6A6A6),
      listen: listen,
    );
  }

  static Color statusGreyColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffE3E3E3),
      dark: const Color(0xffE3E3E3),
      listen: listen,
    );
  }

  static Color redColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffBB2525),
      dark: const Color(0xffBB2525),
      listen: listen,
    );
  }

  static Color redLightColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffFAE5E5),
      dark: const Color(0xffFAE5E5),
      listen: listen,
    );
  }

  static Color greenColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff0A8A0F),
      dark: const Color(0xff0A8A0F),
      listen: listen,
    );
  }

  static Color greenLightColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffDEFDDF),
      dark: const Color(0xffDEFDDF),
      listen: listen,
    );
  }

  static Color blackColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff010728),
      dark: const Color(0xff010728),
      listen: listen,
    );
  }

  static Color whiteColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffffffff),
      dark: const Color(0xffffffff),
      listen: listen,
    );
  }

  static Color offWhiteColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffF4F5F7),
      dark: const Color(0xffF4F5F7),
      listen: listen,
    );
  }

  static Color textFormBorderColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFD9D9D9),
      dark: const Color(0xFFD9D9D9),
      listen: listen,
    );
  }

  static Color yellowColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffCCAC00),
      dark: const Color(0xffCCAC00),
      listen: listen,
    );
  }

  static Color yellowLightColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffFFF9D6),
      dark: const Color(0xffFFF9D6),
      listen: listen,
    );
  }

  static Color blueColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff0B409C),
      dark: const Color(0xff0B409C),
      listen: listen,
    );
  }

  static Color blueLightColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFCFDFFB),
      dark: const Color(0xFFCFDFFB),
      listen: listen,
    );
  }

  static Color textFormColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xff000000),
      dark: const Color(0xff000000),
      listen: listen,
    );
  }

  static Color popupColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffFFFFFF),
      dark: const Color(0xffFFFFFF),
      listen: listen,
    );
  }

  static Color appBarTextColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFF23120B),
      dark: const Color(0xFF23120B),
      listen: listen,
    );
  }

  static Color appBarColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffFAFAFA),
      dark: const Color(0xffFAFAFA),
      listen: listen,
    );
  }

  static Color buttonTextColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xffffffff),
      dark: const Color(0xffffffff),
      listen: listen,
    );
  }

  static Color textFormFillColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFFFFFFF),
      dark: const Color(0xFFFFFFFF),
      listen: listen,
    );
  }

  static Color dividerColor(BuildContext context, {bool listen = true}) {
    return AppTheme.getByTheme(
      context,
      light: const Color(0xFFDADADA),
      dark: const Color(0xFFDADADA),
      listen: listen,
    );
  }

  static Gradient appGradient(BuildContext context) {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xff0B409C),
        Color(0xffFDB827),
      ],
    );
  }

  static Gradient appGradientLight(BuildContext context) {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffBCD3FA),
        Color(0xffFEEDC2),
      ],
    );
  }
}
