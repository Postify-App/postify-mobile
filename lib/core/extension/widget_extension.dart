import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/extension/context_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import '../routes/app_routers_import.dart';

extension WidgetExtension on Widget {
  Widget withRotatedBox() => RotatedBox(
    quarterTurns: AppRouters.navigatorKey.currentContext!.isRTL() ? 0 : 2,
    child: this,
  );

  Container setContainerToView({
    double? height,
    double? width,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? radius,
    Color? color,
    Color? borderColor,
    AlignmentGeometry? alignment,
    List<BoxShadow>? shadows,
    Gradient? gradient,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      decoration: ShapeDecoration(
        color: color,
        gradient: gradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          side: borderColor != null
              ? BorderSide(color: borderColor, width: 1)
              : BorderSide.none,
        ),
        shadows: shadows,
      ),
      child: this,
    );
  }

  CircleAvatar circle({
    double radius = 24,
    double borderWidth = 1,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor ?? Colors.transparent,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        foregroundColor: borderColor,
        child: this,
      ),
    );
  }

  Widget withTooltip({required String msg}) =>
      Tooltip(message: msg, child: this);

  Widget withSafeArea({
    EdgeInsets? minimum,
    bool top = true,
    bool bottom = true,
  }) {
    return SafeArea(
      minimum: minimum ?? EdgeInsets.zero,
      top: top,
      bottom: bottom,
      child: this,
    );
  }

  ClipRRect withGlassEffect({
    double? height,
    double? width,
    Color? color,
    bool hasBorder = true,
    double radius = 16,
    double padding = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withValues(alpha: .4),
            borderRadius: BorderRadius.circular(radius.r),
            border: hasBorder
                ? Border.all(
                    color: color ?? Colors.white.withValues(alpha: .6),
                    width: 1.w,
                  )
                : null,
          ),
          child: this,
        ),
      ),
    );
  }

  Widget setTitle({
    String? title,
    Widget? titleIcon,
    double? fontSize,
    TextStyle? titleStyle,
    double gap = 12,
    double titlePadding = 0,
  }) {
    final BuildContext context = AppRouters.navigatorKey.currentContext!;
    return title != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? AppTextStyle.formTitleStyle(context),
                  ).paddingHorizontal(titlePadding),
                  titleIcon ?? const SizedBox.shrink(),
                ],
              ),
              gap.h.verticalSpace,
              this,
            ],
          )
        : this;
  }

  /// set visibility
  Widget visible(bool visible, {Widget? fallback}) {
    return visible ? this : (fallback ?? const SizedBox.shrink());
  }

  Widget setBorder({
    double? width,
    Color? color,
    double radius = 0,
    EdgeInsetsGeometry? padding,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) {
    final BuildContext context = AppRouters.navigatorKey.currentContext!;
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(
          width: width ?? 1,
          strokeAlign: strokeAlign,
          color: color ?? AppColor.borderColor(context),
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }

  Widget center({
    double? heightFactor,
    double? widthFactor,
    bool enabled = true,
  }) {
    return enabled
        ? Center(
            heightFactor: heightFactor,
            widthFactor: widthFactor,
            child: this,
          )
        : this;
  }
}

extension PaddingExtension on Widget {
  /// return padding top
  Padding paddingTop(double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: start),
      child: this,
    );
  }

  Padding paddingEnd(double end) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: end),
      child: this,
    );
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric(double horizontal, double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Padding paddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Padding paddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Padding paddingDirectionalOnly({
    double top = 0.0,
    double start = 0.0,
    double bottom = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      ),
      child: this,
    );
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }
}
