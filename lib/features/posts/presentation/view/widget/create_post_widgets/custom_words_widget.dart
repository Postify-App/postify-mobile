import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';

class CustomWordsWidget extends StatelessWidget {
  final ValueNotifier<List<String>> wordsNotifier;

  const CustomWordsWidget({super.key, required this.wordsNotifier});

  void _removeWord(int index) {
    final words = List<String>.from(wordsNotifier.value);
    words.removeAt(index);
    wordsNotifier.value = words;
  }

  void _addWord(String word) {
    final words = List<String>.from(wordsNotifier.value);
    words.add(word);
    wordsNotifier.value = words;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) {
                final controller = TextEditingController();
                return AlertDialog(
                  scrollable: true,
                  backgroundColor: AppColor.lightMainAppColor(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(AppLocaleKey.addWord.tr()),
                  content: CustomFormField(
                    controller: controller,
                    hintText: AppLocaleKey.addWord.tr(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(AppLocaleKey.cancel.tr()),
                    ),
                    TextButton(
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          _addWord(controller.text.trim());
                        }
                        Navigator.pop(ctx);
                      },
                      child: Text(AppLocaleKey.add.tr()),
                    ),
                  ],
                );
              },
            );
          },
          child:
              Text(
                AppLocaleKey.addWord.tr(),
                style: AppTextStyle.text12RDark(context),
              ).setBorder(
                color: AppColor.darkTextColor(context),
                radius: 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
              ),
        ),
        8.horizontalSpace,

        Expanded(
          child: ValueListenableBuilder<List<String>>(
            valueListenable: wordsNotifier,
            builder: (context, words, _) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  words.length,
                  (index) => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Text(words[index]).setContainerToView(
                        color: AppColor.secondPrimaryColor(context),
                        borderColor: AppColor.darkTextColor(context),
                        radius: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -6,
                        child: InkWell(
                          onTap: () => _removeWord(index),
                          child:
                              SvgPicture.asset(
                                AppImages.assetsSvgClose,
                                colorFilter: ColorFilter.mode(
                                  AppColor.whiteColor(context),
                                  BlendMode.srcIn,
                                ),
                              ).circle(
                                radius: 8,
                                backgroundColor: AppColor.redColor(context),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
