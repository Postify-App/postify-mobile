import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomBottomSheetContainer extends StatefulWidget {
  const CustomBottomSheetContainer(
      {super.key, this.headerText, required this.content});

  final String? headerText;
  final Widget content;
  @override
  State<CustomBottomSheetContainer> createState() =>
      _CustomBottomSheetContainerState();
}

class _CustomBottomSheetContainerState
    extends State<CustomBottomSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom == 0
                ? 16.h
                : MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: AppColor.scaffoldColor(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 30,
                child: Divider(
                  color: AppColor.lightGreyColor(context),
                  thickness: 2,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.headerText ?? '',
              style: AppTextStyle.text16MSecond(context),
            ),
            widget.content
          ],
        ),
      ),
    );
  }
}
