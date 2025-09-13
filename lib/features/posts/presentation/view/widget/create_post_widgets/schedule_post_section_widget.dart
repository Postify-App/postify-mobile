import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/date_methods.dart';

class SchedulePostSectionWidget extends StatelessWidget {
  const SchedulePostSectionWidget({
    super.key,
    required this.selectedDateAndTimeNotifier,
  });

  final ValueNotifier<String?> selectedDateAndTimeNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocaleKey.schedule.tr(),
          style: AppTextStyle.text20MDark(context),
        ),
        Text(
          AppLocaleKey.scheduleDetails.tr(),
          style: AppTextStyle.text13RDark(context),
        ),
        ValueListenableBuilder(
          valueListenable: selectedDateAndTimeNotifier,
          builder: (context, value, child) {
            return Text(
                  selectedDateAndTimeNotifier.value != null
                      ? DateMethods.formatToFullData(
                          selectedDateAndTimeNotifier.value,
                        )
                      : "${AppLocaleKey.selectTime.tr()} | ${AppLocaleKey.selectDate.tr()}",
                  style: AppTextStyle.text14BDark(context),
                )
                .setContainerToView(
                  color: AppColor.secondPrimaryColor(context),
                  radius: 10,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 16),
                  borderColor: AppColor.darkTextColor(context),
                )
                .onTapScaleAnimation(
                  onTap: () {
                    DateMethods.pickDateTime(
                      context,
                      initialDate: DateTime.now(),
                      useUtc: false,
                      backgroundColor: AppColor.secondPrimaryColor(
                        context,
                        listen: false,
                      ),
                      onSuccess: (date) {
                        selectedDateAndTimeNotifier.value = date;
                      },
                    );
                  },
                );
          },
        ),
      ],
    );
  }
}
