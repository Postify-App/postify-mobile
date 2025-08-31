import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../extension/context_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final TextEditingController? controller;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final double? fieldWidth;
  final double? fieldHeight;
  final double? spacing;
  final bool showNumbers;

  const CustomOtpField({
    super.key,
    this.length = 4,
    this.controller,
    this.onCompleted,
    this.onChanged,
    this.fieldWidth = 60,
    this.fieldHeight = 60,
    this.spacing = 16,
    this.showNumbers = true,
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late ValueNotifier<String> currentPinNotifier;

  @override
  void initState() {
    super.initState();
    currentPinNotifier = ValueNotifier<String>(widget.controller?.text ?? '');
  }

  @override
  void dispose() {
    currentPinNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: ValueListenableBuilder<String>(
          valueListenable: currentPinNotifier,
          builder: (context, currentPin, _) {
            return Pinput(
              controller: widget.controller,
              length: widget.length,
              showCursor: false,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              defaultPinTheme: PinTheme(
                width: widget.fieldWidth!,
                height: widget.fieldHeight!,
                margin: EdgeInsets.symmetric(horizontal: widget.spacing! / 2),
                textStyle: AppTextStyle.text20SSecond(context).copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  color: AppColor.mainAppColor(context).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.mainAppColor(
                      context,
                    ).withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
              ),

              focusedPinTheme: PinTheme(
                width: widget.fieldWidth!,
                height: widget.fieldHeight!,
                margin: EdgeInsets.symmetric(horizontal: widget.spacing! / 2),
                textStyle: AppTextStyle.text20SSecond(context).copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor.mainAppColor(context),
                ),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor(context),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.mainAppColor(context),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.mainAppColor(
                        context,
                      ).withValues(alpha: 0.2),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),

              submittedPinTheme: PinTheme(
                width: widget.fieldWidth!,
                height: widget.fieldHeight!,
                margin: EdgeInsets.symmetric(horizontal: widget.spacing! / 2),
                textStyle: AppTextStyle.text20SSecond(context).copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColor.mainAppColor(context),
                ),
                decoration: const BoxDecoration(color: Colors.transparent),
              ),

              followingPinTheme: PinTheme(
                width: widget.fieldWidth!,
                height: widget.fieldHeight!,
                margin: EdgeInsets.symmetric(horizontal: widget.spacing! / 2),
                textStyle: AppTextStyle.text20SSecond(context).copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  color: AppColor.mainAppColor(context).withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.mainAppColor(
                      context,
                    ).withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
              ),

              errorPinTheme: PinTheme(
                width: widget.fieldWidth!,
                height: widget.fieldHeight!,
                margin: EdgeInsets.symmetric(horizontal: widget.spacing! / 2),
                textStyle: AppTextStyle.text20SSecond(context).copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.shade700, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withValues(alpha: 0.3),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),

              errorBuilder: (errorText, pin) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: context.getByLang(
                      ar: AlignmentDirectional.centerEnd,
                      en: AlignmentDirectional.centerStart,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 16,
                            color: Colors.red.shade700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            errorText!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },

              validator: (s) {
                if (s == null || s.trim().isEmpty) {
                  return context.apiTr(
                    ar: 'الرجاء إدخال الكود',
                    en: 'Please enter the code',
                  );
                }
                return s.trim().length == widget.length
                    ? null
                    : context.apiTr(
                        ar: 'الكود مكون من ${widget.length} أرقام',
                        en: 'The code consists of ${widget.length} digits',
                      );
              },

              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },

              onChanged: (value) {
                currentPinNotifier.value = value;
                widget.onChanged?.call(value);
              },
              onCompleted: widget.onCompleted,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              keyboardType: TextInputType.number,
              animationDuration: const Duration(milliseconds: 200),
              animationCurve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
