import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';

class SelectSocialPlatformSectionWidget extends StatefulWidget {
  const SelectSocialPlatformSectionWidget({super.key});

  @override
  State<SelectSocialPlatformSectionWidget> createState() =>
      _SelectSocialPlatformSectionWidgetState();
}

class _SelectSocialPlatformSectionWidgetState
    extends State<SelectSocialPlatformSectionWidget> {
  ValueNotifier<List<InitiateGeneralModel>> socialOptionsNotifier =
      ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocaleKey.socialPlatform.tr(),
          style: AppTextStyle.text20MDark(context),
        ),
        Text(
          AppLocaleKey.selectPlatforms.tr(),
          style: AppTextStyle.text13RDark(context),
        ),
        16.verticalSpace,
        ValueListenableBuilder(
          valueListenable: socialOptionsNotifier,
          builder: (context, value, child) {
            return Row(
              children: [
                ...List.generate(
                  socialOptions.length,
                  (index) => Image.asset(socialOptions[index].logo ?? '')
                      .circle(
                        backgroundColor:
                            socialOptionsNotifier.value.contains(
                              socialOptions[index],
                            )
                            ? AppColor.darkTextColor(context)
                            : Colors.transparent,
                        radius: 18,
                      )
                      .onTapScaleAnimation(
                        onTap: () {
                          final updated = List<InitiateGeneralModel>.from(
                            socialOptionsNotifier.value,
                          );
                          if (updated.contains(socialOptions[index])) {
                            updated.remove(socialOptions[index]);
                          } else {
                            updated.add(socialOptions[index]);
                          }
                          socialOptionsNotifier.value = updated;
                        },
                      ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
