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

class CustomWordsWidget extends StatefulWidget {
  final ValueNotifier<List<String>> wordsNotifier;
  final Function(List<String>) wordsCallback;

  const CustomWordsWidget({
    super.key,
    required this.wordsNotifier,
    required this.wordsCallback,
  });

  @override
  State<CustomWordsWidget> createState() => _CustomWordsWidgetState();
}

class _CustomWordsWidgetState extends State<CustomWordsWidget> {
  void _removeWord(int index) {
    final words = List<String>.from(widget.wordsNotifier.value);
    words.removeAt(index);
    widget.wordsNotifier.value = words;
    widget.wordsCallback(widget.wordsNotifier.value);
  }

  void _addWord(String word) {
    final words = List<String>.from(widget.wordsNotifier.value);
    words.add(word);
    widget.wordsNotifier.value = words;
    widget.wordsCallback(widget.wordsNotifier.value);
  }

  @override
  initState() {
    super.initState();
    widget.wordsCallback(widget.wordsNotifier.value);
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
            valueListenable: widget.wordsNotifier,
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
