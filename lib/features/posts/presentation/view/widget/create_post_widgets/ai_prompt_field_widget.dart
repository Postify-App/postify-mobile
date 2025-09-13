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
import 'package:postify/core/images/app_images.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/core/theme/app_colors.dart';

import '../../../controller/generate_post_cubit/generate_post_cubit.dart';

class AiPromptFieldWidget extends StatefulWidget {
  const AiPromptFieldWidget({super.key});

  @override
  State<AiPromptFieldWidget> createState() => _AiPromptFieldWidgetState();
}

class _AiPromptFieldWidgetState extends State<AiPromptFieldWidget>
    with ValidationMixin {
  final aiPromptController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    aiPromptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratePostCubit, GeneratePostState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: CustomFormField(
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
                          if (!formKey.currentState!.validate()) return;
                          context.read<GeneratePostCubit>().setMessage(
                            aiPromptController.text,
                          );
                          context.read<GeneratePostCubit>().generatePost();
                        },
                      ),
                8.horizontalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
