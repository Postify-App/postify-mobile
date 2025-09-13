import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:postify/core/custom_widgets/validation/validation_mixin.dart';
import 'package:postify/core/enum/cubit_state/cubit_status.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/core/theme/app_text_style.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_home_button.dart';
import 'package:postify/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:postify/features/posts/data/model/post_request_model.dart';
import 'package:postify/features/posts/presentation/controller/generate_post_cubit/generate_post_cubit.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/ai_output_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/approximate_words_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/create_post_header_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/custom_post_tyoe_taps_widget.dart';
import 'package:postify/features/posts/presentation/view/widget/create_post_widgets/custom_words_widget.dart';
import 'package:postify/features/profile/presentation/controller/profile_cubit.dart';

class AiPromptContent extends StatefulWidget {
  const AiPromptContent({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<AiPromptContent> createState() => _AiPromptContentState();
}

class _AiPromptContentState extends State<AiPromptContent>
    with ValidationMixin {
  final aiPromptController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String businessId;

  @override
  void dispose() {
    aiPromptController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    businessId = context.read<ProfileCubit>().state.selectedBusiness?.id ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneratePostCubit(businessId),
      child: BlocConsumer<GeneratePostCubit, GeneratePostState>(
        listener: (context, state) {
          if (state.status == CubitStatus.failure) {
            CommonMethods.showError(message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomHomeAppBar(),
                    16.verticalSpace,
                    const CustomHeaderWidget(),
                    const AiOutputWidget(),
                    const CustomPostTypeTapsWidget(),
                    24.verticalSpace,
                    const ApproximateWordsWidget(),
                    8.verticalSpace,
                    CustomWordsWidget(
                      wordsNotifier: ValueNotifier([
                        'Organic',
                        'Handmade',
                        'Travel',
                      ]),
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
                      validator: validateEmptyField,
                      maxLines: null,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppImages.assetsSvgVoice),
                          8.horizontalSpace,
                          state.status == CubitStatus.loading
                              ? const CupertinoActivityIndicator()
                              : SvgPicture.asset(
                                  AppImages.assetsSvgSend,
                                ).onTapScaleAnimation(
                                  onTap: () {
                                    if (!formKey.currentState!.validate())
                                      return;
                                    context
                                        .read<GeneratePostCubit>()
                                        .generatePost(
                                          GenerateRequestBody(
                                            message: aiPromptController.text,
                                          ),
                                        );
                                  },
                                ),
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
            ),
          );
        },
      ),
    );
  }
}
