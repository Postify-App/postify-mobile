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
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/ai_output_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/approximate_words_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/create_post_header_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/custom_post_tyoe_taps_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/custom_words_widget.dart';

class AiPromptContent extends StatefulWidget {
  const AiPromptContent({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<AiPromptContent> createState() => _AiPromptContentState();
}

class _AiPromptContentState extends State<AiPromptContent> {
  final aiPromptController = TextEditingController();

  @override
  void dispose() {
    aiPromptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          children: [
            const CustomHomeAppBar(),
            16.verticalSpace,
            const CustomHeaderWidget(),
            const AiOutputWidget(),
            const CustomPostTypeTapsWidget(),
            24.verticalSpace,
            const ApproximateWordsWidget(),
            // 24.verticalSpace,
            // const CustomToneOfVoiceSelectedWidget(),
            8.verticalSpace,
            CustomWordsWidget(
              wordsNotifier: ValueNotifier(['Organic', 'Handmade', 'Travel']),
            ).setTitle(
              title: AppLocaleKey.requiredWords.tr(),
              titleStyle: AppTextStyle.text16RDark(context),
            ),
            24.verticalSpace,
            CustomWordsWidget(
              wordsNotifier: ValueNotifier(['Cheap', 'Discount']),
            ).setTitle(
              title: AppLocaleKey.forbiddenWords.tr(),
              titleStyle: AppTextStyle.text16RDark(context),
            ),
            24.verticalSpace,
            CustomFormField(
              controller: aiPromptController,
              hintText: AppLocaleKey.aiPrompt.tr(),
              unFocusColor: AppColor.darkTextColor(context),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppImages.assetsSvgVoice),
                  8.horizontalSpace,
                  SvgPicture.asset(AppImages.assetsSvgSend),
                  8.horizontalSpace,
                ],
              ),
            ),
            24.verticalSpace,
            CustomHomeButton(
              text: AppLocaleKey.continueKey.tr(),
              color: AppColor.darkTextColor(context),
              onPressed: widget.onPressed,
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
