import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/custom_widgets/validation/validation_mixin.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class ApproximateWordsWidget extends StatefulWidget {
  const ApproximateWordsWidget({super.key});

  @override
  State<ApproximateWordsWidget> createState() => _ApproximateWordsWidgetState();
}

class _ApproximateWordsWidgetState extends State<ApproximateWordsWidget>
    with ValidationMixin {
  final wordsController = TextEditingController();

  @override
  void dispose() {
    wordsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    wordsController.text = '32';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocaleKey.approximateWords.tr(),
          style: AppTextStyle.text16MDark(context),
        ),
        const Spacer(),
        // SizedBox(
        //   width: 100.w,
        //   child: CustomLinearSlider(
        //     value: 0.5,
        //     activeColor: AppColor.darkTextColor(context),
        //     inactiveColor: AppColor.secondPrimaryColor(context),
        //   ),
        // ),
        24.horizontalSpace,
        CustomFormField(
          controller: wordsController,
          hintText: '100',
          width: 50.w,
          unFocusColor: AppColor.darkTextColor(context),
          keyboardType: TextInputType.number,
          validator: validateEmptyField,
        ),
      ],
    );
  }
}
