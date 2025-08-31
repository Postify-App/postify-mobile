import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomButton extends StatefulWidget {
  final double radius;
  final double? width;
  final double height;
  final TextStyle? style;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final Gradient? gradient;
  final CubitStatus? cubitState;
  final bool isLoading;
  final bool isMainColor;
  final bool hasShadow;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? textColor;
  final Color? loaderColor;
  final bool isEnabled;

  const CustomButton({
    super.key,
    this.radius = 30,
    this.width,
    this.height = 57,
    this.style,
    this.text,
    this.prefixIcon = const SizedBox(),
    this.suffixIcon = const SizedBox(),
    this.color,
    this.gradient,
    this.cubitState,
    this.isLoading = false,
    this.isMainColor = true,
    this.hasShadow = false,
    this.onPressed,
    this.child,
    this.borderColor,
    this.borderRadius,
    this.boxShadow,
    this.textColor,
    this.loaderColor,
    this.isEnabled = true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).chain(CurveTween(curve: Curves.easeOut)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ClipRRect(
        borderRadius:
            widget.borderRadius ??
            BorderRadius.only(
              topRight: Radius.circular(widget.radius),
              bottomRight: Radius.circular(widget.radius),
              bottomLeft: Radius.circular(widget.radius),
            ),
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height.h,
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? widget.color ??
                      (widget.isMainColor
                          ? AppColor.mainAppColor(context)
                          : AppColor.secondAppColor(context))
                : AppColor.greenColor(context),
            gradient: widget.isEnabled ? widget.gradient : null,
            borderRadius:
                widget.borderRadius ??
                BorderRadius.only(
                  topRight: Radius.circular(widget.radius),
                  bottomRight: Radius.circular(widget.radius),
                  bottomLeft: Radius.circular(widget.radius),
                ),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!)
                : null,
            boxShadow: widget.hasShadow
                ? widget.boxShadow ??
                      [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          offset: const Offset(0, 0),
                          blurRadius: 6,
                        ),
                      ]
                : null,
          ),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap:
                    widget.isLoading ||
                        widget.cubitState == CubitStatus.loading ||
                        widget.isEnabled == false
                    ? null
                    : () {
                        _controller.forward().then((_) {
                          _controller.reverse();
                          widget.onPressed?.call();
                        });
                      },
                child: Center(
                  child:
                      widget.isLoading ||
                          widget.cubitState == CubitStatus.loading
                      ? CupertinoActivityIndicator(
                          color:
                              widget.loaderColor ??
                              AppColor.whiteColor(context),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.prefixIcon != null) ...{
                              widget.prefixIcon!,
                              const SizedBox(width: 5),
                            },
                            Flexible(
                              child:
                                  widget.child ??
                                  Text(
                                    widget.text ?? "",
                                    textAlign: TextAlign.center,
                                    style:
                                        widget.style ??
                                        AppTextStyle.buttonStyle(
                                          context,
                                        ).copyWith(
                                          color:
                                              widget.textColor ??
                                              AppColor.buttonTextColor(context),
                                        ),
                                  ),
                            ),
                            if (widget.suffixIcon != null) ...{
                              const SizedBox(width: 5),
                              widget.suffixIcon!,
                            },
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
